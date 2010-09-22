#coding: utf-8

import os.path
import os
try:
    import vim
except ImportError:
    pass

# Try to decide which server to be used.
if vim.eval('exists("g:vimmp_server_type")') == "1":
    kind = vim.eval("g:vimmp_server_type")
    if kind == "xmms2":
        from xmms2wrap import Controller
    elif kind == "mpd":
        from mpdwrap import Controller
    else:
        print "unknown server type."
else:
    try:
        from xmms2wrap import Controller
    except ImportError:
        try:
            from mpd2wrap import Controller
        except ImportError:
            pass


class VimMP(object):
    def __init__(self):
        self.options = self._read_options()
        self.player = Controller(self.options)

        # Previous song, used by indicator code.
        self.prev_song = self.player.current_position()

        self.create_window()

        # Settings for the play window.
        setlist = ['buftype=nofile',
                   'noswapfile',
                   'nobuflisted',
                   'nowrap',
                   'nofoldenable',
                   'cursorline',
                   'nospell',
                   'nolist' ]
        for item in setlist:
            vim.command('silent! setlocal %s' % item)

        # Highlight the current playing song.
        vim.command('syntax match VIMMPCurrent "^-.*"')
        vim.command('hi link VIMMPCurrent Folded')

        self.buf = vim.current.buffer
        self.refresh_window()

    def _read_options(self):
        def read(name):
            if vim.eval('exists("%s")' % name) == "1":
                return vim.eval(name)

        d = {}
        d["id3_encoding"] = read("g:xmms_id3_encoding") or None

        d["debug"] = read("g:vimmp_debug") or False

        d["playlist_format"] = \
                read("g:vimmp_playlist_format") or "%artist - %title"

        d["mpd_music_directory"] = read("g:mpd_music_directory") or None
        d["mpd_playlist_directory"] = read("g:mpd_playlist_directory") or None

        d["window_width"] = int(read("g:xmms_window_width") or "25")

        return d

    def create_window(self):
        # Create a new window on the right.
        vim.command('silent! botright vertical %s split __VIMMP__'
                    % self.options["window_width"])

    def _set_status(self, text):
        vim.command('silent! setlocal statusline=%s' % text)

    def refresh_status(self):
        # Current playlist
        playlist = self.player.get_current_playlist()
        volume = self.player.get_volume()
        repeat = {"one": "O",
                  "all": "A",
                  "off": "-"}[self.player.get_repeat_mode()]
        text = "P:%s\\ V:%s%%%%\\ [%s]" % (playlist, volume, repeat)
        self._set_status(text)

    def _get_path(self, prompt):
        """Return the path enterd by the user, and expand it to full path.
        Or return None if user haven't enter anything."""

        # When input from vim, vim escapes some special characters,
        # so we have to expand them first.
        cwd = vim.eval('expand(getcwd())')
        path = vim.eval('expand(input("%s", "", "file"))' % prompt)
        if path == None or path == "":
            return None
        else:
            return os.path.join(cwd, os.path.expanduser(path))

    def _get_relative_path(self, prompt, root="."):
        """Return the path enterd by the user relative to the root.
        Or return None if user haven't enter anything.
        """
        cwd = os.getcwd()
        os.chdir(root)
        path = vim.eval('expand(input("%s", "", "file"))' % prompt)
        os.chdir(cwd)
        if path == "":
            path = None
        return path

    def _current_line_number(self):
        """Returns the line number where the cursor stands."""

        # In Vim, line number starts with 1. But in Python,
        # list starts with 0, and in xmms2, the position also
        # starts with 0, so we minus the vim's line number by 1.
        return vim.current.window.cursor[0] - 1

    def play(self):
        line = self._current_line_number()
        self.player.play(line)
        self.refresh_mark()

    def _get_input(self, prompt):
        text = vim.eval('expand(input("%s"))' % prompt)
        if text == None or text == "":
            return None
        return text

    def load_playlist(self):
        if self.player.type == "xmms2":
            lst = self.player.get_playlists()
            try:
                lst.remove('_active')
            except ValueError:
                pass
            show = '["Playlist:", ' \
                    + "".join(['"%s. %s", ' % (i+1,x)
                               for i, x in enumerate(lst)])\
                    + ']'
            n = int(vim.eval('inputlist(%s)' % show))
            if n >= 1:
                self.player.load_playlist(lst[n-1])
        elif self.player.type == "mpd":
            name = self._get_relative_path("Playlist: ",
                                           self.player.playlist_directory)
            if name.endswith(".m3u"):
                name = name[:-4]
            self.player.load_playlist(name)

        self.refresh_window()

    def set_repeat_mode(self):
        if self.player.type == "xmms2":
            n = int(vim.eval(
                'inputlist(["Repeat Mode:", "1. ALL", "2. ONE", "3. OFF"])'))
            if 1 <= n <= 3:
                self.player.set_repeat_mode(["", "all", "one", "off"][n])
        elif self.player.type == "mpd":
            self.player.repeat()
        self.refresh_status()

    def sort_playlist(self):
        n = int(vim.eval('inputlist(["Sort Playlist:",\
                         "1. Artist", "2. Title", "3. File"])'))
        if 1 <= n <= 4:
            self.player.sort_playlist(["",
                                       "artist",
                                       "title",
                                       "file"][n])
        self.refresh_window()

    def save_playlist(self):
        name = self._get_input("Playlist name: ")
        self.player.save_playlist(name)

    def add_path(self):
        """Prompt and add a music file or directory to the playlist."""
        if self.player.type == "xmms2":
            name = self._get_path("Music File or Directory: ")
        elif self.player.type == "mpd":
            name = self._get_relative_path("Music File or Directory: ",
                                           self.player.music_directory)
        if name != None:
            self._clear_window()
            self.player.add(name)
            self.refresh_window()

    def _clear_window(self):
        """Remove all lines in the window."""
        self.buf[:] = []

    def shuffle_playlist(self):
        self.player.shuffle()
        self.refresh_window()

    def increase_volume(self):
        cur = self.player.change_volume(6)
        self.refresh_status()

    def decrease_volume(self):
        cur = self.player.change_volume(-6)
        self.refresh_status()

    def clear_playlist(self):
        """Clear playlist."""
        self.player.clear()
        self._clear_window()

    def delete(self):
        line = self._current_line_number()
        if self.buf[line] != '':
            self.player.delete(line)
            self.refresh_window(False)

    def refresh_window(self, cursor=True):
        """Refresh the play window."""
        self.buf[:] = self.player.playlist()
        if self.prev_song != None:
            self.refresh_mark(cursor)
        self.refresh_status()

    def refresh_window_if_open(self):
        winnum = vim.eval('bufwinnr("__VIMMP__")')

        if winnum != "-1":
            prevwin = vim.eval("winnr()")
            if prevwin == winnum:
                self.refresh_window(False)
            else:
                vim.command(winnum + "wincmd w")
                self.refresh_window(False)
                vim.command(prevwin + 'wincmd w')

    def refresh_mark(self, cursor=True):
        """Refresh the current playing music indicator."""
        current = self.player.current_position()
        if current != None:
            if self.prev_song != None and self.prev_song < len(self.buf):
                self.buf[self.prev_song] = ' ' + self.buf[self.prev_song][1:]
            self.buf[current] = '-' + self.buf[current][1:]
            self.prev_song = current
            # Move cursor to current position.
            if cursor:
                vim.current.window.cursor = (current + 1, 1)

    def stop_play(self):
        self.player.stop()

    def pause_play(self):
        self.player.pause()
