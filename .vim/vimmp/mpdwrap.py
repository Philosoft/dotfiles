#coding: utf-8

import os.path
import socket
import mpd

class Controller(object):
    """A simple wrapper for mpd.MPDClient."""

    def __init__(self, options):
        self.m = mpd.MPDClient()
        self.type = "mpd"
        try:
            self._connect()
        except socket.error:
            os.system('mpd')
            self._connect()

        self.options = options
        self.music_directory = os.path.expanduser(
            self.options["mpd_music_directory"])
        self.playlist_directory = os.path.expanduser(
            self.options["mpd_playlist_directory"])

    def _connect(self):
        try:
            self.m.disconnect()
        except mpd.ConnectionError:
            pass
        self.m.connect("localhost", 6600)

    def _get_status(self):
        self.m.status()['state']

    def _get_id(self, pos):
        id = self.m.playlistinfo()[pos]['id']
        return int(id)

    def play(self, pos):
        self.m.playid(self._get_id(pos))

    def delete(self, pos):
        self.m.deleteid(self._get_id(pos))

    def clear(self):
        self.m.clear()

    def pause(self):
        if self._get_status == "pause":
            self.m.pause(1)
        else:
            self.m.pause()

    def get_volume(self):
        return int(self.m.status()['volume'])

    def repeat(self):
        self.m.repeat(0 if self.get_repeat_mode() == "all" else 1)

    def _set_volume(self, num):
        self.m.setvol(num)

    def change_volume(self, num):
        value = self.get_volume() + num

        if 0 <= value <= 100:
            self._set_volume(value)
        else:
            self._set_volume(0 if value < 0 else 100)

        return self.get_volume()

    def stop(self):
        self.m.stop()

    def shuffle(self):
        self.m.shuffle()

    def save_playlist(self, name):
        filepath = os.path.join(self.playlist_directory, name + '.m3u')
        if os.path.exists(filepath):
            os.system('rm ' + filepath)
        self.m.save(name)

    def load_playlist(self, name):
        self.m.load(name)

    def get_current_playlist(self):
        return self.m.status()['playlist']

    def add(self, path):
        self.m.add(path)

    def current_position(self):
        """Return current position in the playlist."""

        song = self.m.currentsong()
        return None if song == {} else int(self.m.currentsong()["pos"])

    def song(self):
        'return current id'
        c = ct()
        if c.status().has_key('song'):
            return int(c.status()['song'])
        else:
            return -1

    def playlist(self):
        self._connect()
        lst = []
        for x in  self.m.playlistinfo():
            line = self.options["playlist_format"]
            line = line.replace("%title", x["title"])
            line = line.replace("%artist", x["artist"])
            line = line.replace("%album", x["album"])
            lst.append("  " + line)
        return lst

    def get_repeat_mode(self):
        mode = self.m.status()['repeat']
        return { "0": "off", "1": "all" }[mode]
