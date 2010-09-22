#coding: utf-8

'''vimmp: XMMS2 and MPD client for Vim.

File: main.py
Author: Xin Wang
Email: wxyzin at gmail.com
Version: 0.1.1
Date: 2008-09-04

This plugin is provided under BSD-ish license.
'''

import vim
import vimmp

def vimmp_toggle():
    global g_vimmp

    winnum = vim.eval('bufwinnr("__VIMMP__")')
    # If bufwinnr returns -1, then there's no window named __VIMMP__,
    # so we create one, otherwise we close it.
    if winnum == '-1':
        try:
            g_vimmp.create_window()
        except NameError:
            g_vimmp = vimmp.VimMP()
            vimmp_keymap()
            vim.command('au WinEnter __VIMMP__ py g_vimmp.refresh_window()')
            vim.command('au CursorHold * py g_vimmp.refresh_window_if_open()')
    else:
        # If current window is __VIMMP__, we close it directly.
        # But when the cursor is in other window, we first remember
        # the window number, and jump to __VIMMP__, close it,
        # then jump back to previous window.
        bufname = vim.current.buffer.name
        if bufname != None and bufname.endswith('__VIMMP__'):
            # We close __VIMMP__ only when there are other windows exists.
            if len(vim.windows) > 1:
                vim.command('close')
        else:
            prevbuf = vim.eval('bufnr("%")')
            vim.command(winnum + 'wincmd w')
            vim.command('close')
            prevwin = vim.eval('bufwinnr(%s)' % prevbuf)
            if vim.eval('winnr()') != prevwin:
                vim.command(prevwin + 'wincmd w')

def vimmp_keymap():
    """Key mappings."""
    mapcmd = 'nnoremap <buffer> <silent> %s :py g_vimmp.%s()<cr>'
    maplist = [
        ('r',       'refresh_window'),
        ('<space>', 'play'),
        ('<cr>',    'play'),
        ('=',       'increase_volume'),
        ('-',       'decrease_volume'),
        ('la',      'add_path'),
        ('lc',      'clear_playlist'),
        ('ld',      'delete'),
        ('lf',      'shuffle_playlist'),
        ('ll',      'load_playlist'),
        ('ln',      'save_playlist'),
        ('ls',      'sort_playlist'),
        ('cp',      'pause_play'),
        ('cr',      'set_repeat_mode'),
        ('cs',      'stop_play'),
        ('<2-leftmouse>', 'play'),
    ]

    for item in maplist:
        vim.command(mapcmd % item)
