# -*- coding: utf-8 -*-

import sys
import os
import fontforge
import psMat


def _replace_glyphs(font, other_font, codepoints):
    # type: (fontforge.font, fontforge.font, [int]) -> None
    for codepoint in codepoints:
        first, last = codepoint
        other_font.selection.select(('ranges', 'unicode'), first, last)
        other_font.copy()
        font.selection.select(('ranges', 'unicode'), first, last)
        font.paste()


def _modify_glyphs(font):
    # type: (fontforge.font) -> None
    ASTERISK = 0x002a
    font[ASTERISK].transform(psMat.translate(0, -246))


def _merge_glyphs(font, other_font_file):
    # type: (fontforge.font, str) -> None
    font.mergeFonts(other_font_file)


def modify_mplus_1mn(mplus_1mn_file, mplus_1m_file, genei_gothic_file, dest_dir):
    # type: (str, str, str, str) -> None
    if not os.path.exists(mplus_1mn_file):
        raise Exception('File not found: {}'.format(mplus_1mn_file))
    if not os.path.exists(mplus_1m_file):
        raise Exception('File not found: {}'.format(mplus_1m_file))
    if not os.path.exists(dest_dir):
        os.mkdir(dest_dir)
    if not os.path.isdir(dest_dir):
        raise Exception('\'{}\' must be a directory'.format(dest_dir))
    codepoints = [(0x0026, 0x0026)]  # ampersand
    font_1mn = fontforge.open(mplus_1mn_file)
    font_1m = fontforge.open(mplus_1m_file)
    _replace_glyphs(font_1mn, font_1m, codepoints)
    _modify_glyphs(font_1mn)
    _merge_glyphs(font_1mn, genei_gothic_file)
    dest_file = os.path.basename(mplus_1mn_file)
    font_1mn.generate(os.path.join(dest_dir, dest_file))
    font_1mn.close()
    font_1m.close()


if __name__ == '__main__':
    if len(sys.argv) <= 4:
        print('Usage: {} <M+ 1mn file> <M+ 1m file> <GenEi Gothic file> <destination directory>'.format(sys.argv[0]))
    else:
        modify_mplus_1mn(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
