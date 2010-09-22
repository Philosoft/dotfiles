#coding: utf-8

import os.path
import os
import xmmsclient
import urllib
import locale

class Controller(object):
    """A simple wrapper class of xmmsclient.XMMS."""

    def __init__(self, options):
        self.x = xmmsclient.XMMS('VIM')
        self.type = "xmms2"
        try:
            self.x.connect()
        except IOError:
            os.system('xmms2-launcher > /dev/null')
            self.x.connect()

        self.options = options
        self.system_encoding = locale.getdefaultlocale()[1]

    def _get_status(self):
        r = self.x.playback_status()
        r.wait()
        val = r.get_uint()
        if val == xmmsclient.PLAYBACK_STATUS_PLAY:
            return "play"
        elif val == xmmsclient.PLAYBACK_STATUS_PAUSE:
            return "pause"
        elif val == xmmsclient.PLAYBACK_STATUS_STOP:
            return "stop"
        else:
            return "unknown"

    def play(self, pos):
        if self.current_position() != pos:
            self.x.playlist_set_next(pos).wait()
            self.x.playback_tickle().wait()
        if self._get_status() != "play":
            self.x.playback_start().wait()

    def delete(self, pos):
        """Remove a song from playlist.

        If the song to be removed is playing now, we first stop it.
        """
        if self._get_status() == "play" and self.current_position() == pos:
                self.x.playback_stop().wait()
        self.x.playlist_remove_entry(pos).wait()

    def clear(self):
        self.x.playback_stop().wait()
        self.x.playlist_clear().wait()

    def pause(self):
        if self._get_status() == "pause":
            self.x.playback_start().wait()
        else:
            self.x.playback_pause().wait()

    def get_volume(self):
        r = self.x.playback_volume_get()
        r.wait()
        return r.get_dict()['left']

    def _set_volume(self, val):
        self.x.playback_volume_set('left', val).wait()
        self.x.playback_volume_set('right', val).wait()

    def change_volume(self, num):
        value = self.get_volume() + num

        if 0 <= value <= 100:
            self._set_volume(value)
        else:
            self._set_volume(0 if value < 0 else 100)

        return self.get_volume()

    def stop(self):
        self.x.playback_stop().wait()

    def shuffle(self):
        self.x.playlist_shuffle().wait()

    def sort_playlist(self, mode):
        if mode == "artist":
            self.x.playlist_sort(('plugin/id3v2', 'artist')).wait()
        elif mode == "title":
            self.x.playlist_sort(('plugin/id3v2', 'title')).wait()
        elif mode == "file":
            self.x.playlist_sort(('server', 'url')).wait()

    def save_playlist(self, name):
        self.x.playlist_create(name).wait()
        r = self.x.playlist_list_entries()
        r.wait()
        for i, id in enumerate(r.get_list()):
            self.x.playlist_insert_id(i, id, name).wait()

    def load_playlist(self, name):
        self.x.playlist_load(name).wait()

    def get_playlists(self):
        r = self.x.playlist_list()
        r.wait()
        return [x.encode(self.system_encoding) for x in r.get_list()]

    def get_current_playlist(self):
        r = self.x.playlist_current_active()
        r.wait()
        return r.get_string().encode(self.system_encoding)

    def add(self, path):
        url = 'file://' + path
        if os.path.isfile(path):
            self.x.playlist_add_url(url).wait()
        else:
            self.x.playlist_radd(url).wait()

    def current_position(self):
        """Return current position in the playlist."""

        # It is an error to call playlist_current_pos when there are
        # no entries in the playlist.
        r = self.x.playlist_current_pos()
        r.wait()
        if r.iserror():
            if self.options['debug']:
                print r.get_error(), "in Controller.current_position."
            return None
        else:
            return r.get_dict()['position']

    def playlist(self):
        """Format the playlist.
        
        First we try to get imformation from id3v2, if it fails,
        then try id3, else we just display the file name.
        """
        def iconv(s):
            encoding = self.options["id3_encoding"]
            try:
                if encoding:
                    t = s.encode('latin1').decode(encoding)
                    return t.encode(self.system_encoding)
                else:
                    return s.encode('latin1')
            except UnicodeEncodeError:
                return ""

        lst = []
        r = self.x.playlist_list_entries()
        r.wait()
        for id in r.get_list():
            r = self.x.medialib_get_info(id)
            r.wait()
            if r.iserror():
                if self.options['debug']:
                    print r.get_error(), "in Controller.playlist."
                lst.append(' ')
                continue
            song = r.get_propdict()
            try:
                artist = iconv(song[('plugin/id3v2', 'artist')])
            except KeyError:
                try:
                    artist = iconv(song[('plugin/mad', 'artist')])
                except KeyError:
                    artist = ''
            try:
                title = iconv(song[('plugin/id3v2', 'title')])
            except KeyError:
                try:
                    title = iconv(song[('plugin/mad', 'title')])
                except KeyError:
                    title = ''
            try:
                album = iconv(song[('plugin/id3v2', 'album')])
            except KeyError:
                try:
                    album = iconv(song[('plugin/mad', 'album')])
                except KeyError:
                    album = ''
            if artist == "" and title == "":
                name = os.path.split(song[('server', 'url')])[1]
                name = os.path.splitext(name)[0]
                name = urllib.unquote(
                    name.decode(self.system_encoding).encode('latin1'))
                name = name.replace("+", " ")
                lst.append('  ' + name)
            else:
                line = self.options["playlist_format"]
                line = line.replace("%title", title)
                line = line.replace("%artist", artist)
                line = line.replace("%album", album)
                lst.append('  ' + line)

        return lst

    def set_repeat_mode(self, mode):
        def set(key, val):
            self.x.configval_set(key, val).wait()

        if mode == "all":
            set("playlist.repeat_one", "0")
            set("playlist.repeat_all", "1")
        elif mode == "one":
            set("playlist.repeat_one", "1")
            set("playlist.repeat_all", "0")
        elif mode == "off":
            set("playlist.repeat_one", "0")
            set("playlist.repeat_all", "0")

    def get_repeat_mode(self):
        d = { "0": False, "1": True }
        r = self.x.configval_get("playlist.repeat_one")
        r.wait()
        one = d[r.get_string()]

        r = self.x.configval_get("playlist.repeat_all")
        r.wait()
        all = d[r.get_string()]
        
        if all:
            return "all"
        elif one:
            return "one"
        else:
            return "off"
