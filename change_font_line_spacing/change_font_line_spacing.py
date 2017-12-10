#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
The original version is:
  http://blog.kaorimatz.org/2013/12/14/adjust-line-spacing-for-text-on-terminal.html
"""

import sys
import os
import fontforge


def change_font_line_spacing(src_file, dest_dir, ascent, descent):
    # type: (str, str, int, int) -> None
    if not os.path.exists(src_file):
        raise Exception('File not found: {}'.format(src_file))
    if not os.path.exists(dest_dir):
        os.mkdir(dest_dir)
    if not os.path.isdir(dest_dir):
        raise Exception('\'{}\' must be a directory'.format(dest_dir))
    font = fontforge.open(src_file)
    font.os2_winascent = ascent
    font.os2_winascent_add = False
    font.os2_windescent = -descent
    font.os2_windescent_add = False
    font.hhea_ascent = ascent
    font.hhea_ascent_add = False
    font.hhea_descent = descent
    font.hhea_descent_add = False
    dest_file = os.path.basename(src_file)
    font.generate(os.path.join(dest_dir, dest_file))
    font.close()


if __name__ == '__main__':
    if len(sys.argv) != 5:
        print('usage: {} <source font file> <destination directory> <new ascent> <new descent>'.format(sys.argv[0]))
    else:
        change_font_line_spacing(sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4]))
