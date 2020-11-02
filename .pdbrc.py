#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 zenbook <zenbook@zenbook-XPS>
#
# Distributed under terms of the MIT license.

"""

"""


import pdb


class Config(pdb.DefaultConfig):

    editor = "e"
    stdin_paste = "epaste"
    filename_color = pdb.Color.lightgray
    use_terminal256formatter = False
    use_pygments = True
    sticky_by_default = True
    # exec_if_unfocused = "play ~/sounds/dialtone.wav 2> /dev/null &"

    def __init__(self):
        # import readline
        # readline.parse_and_bind('set convert-meta on')
        # readline.parse_and_bind('Meta-/: complete')

        try:
            from pygments.formatters import terminal
        except ImportError:
            pass
        else:
            self.colorscheme = terminal.TERMINAL_COLORS.copy()
            self.colorscheme.update(
                {
                    terminal.Keyword: ("darkred", "red"),
                    terminal.Number: ("darkyellow", "yellow"),
                    terminal.String: ("brown", "green"),
                    terminal.Name.Function: ("darkgreen", "blue"),
                    terminal.Name.Namespace: ("teal", "white"),
                }
            )

    def setup(self, pdb):
        # make 'l' an alias to 'longlist'
        Pdb = pdb.__class__
        Pdb.do_l = Pdb.do_longlist
        Pdb.do_st = Pdb.do_sticky
