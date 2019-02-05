#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

import re

import snake


@snake.when_buffer_is("python")
def setup_python(ctx):
    @snake.key_map("<leader>r")
    def import_new_library():
        word = snake.get_word()
        if word == 'Path':
            import_txt = 'from pathlib import Path'
        else:
            import_txt = 'import %s' % (word)
        snake.command("call append(line('$'), '%s')" % (import_txt))
        snake.command(":Isort")
