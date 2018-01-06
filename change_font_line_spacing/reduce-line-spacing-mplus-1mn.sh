#!/bin/bash

ascender_base=815
descender_base=-230
ascender_margin=30
descender_margin=-30
new_ascender=$((ascender_base+ascender_margin))
new_descender=$((descender_base+descender_margin))

# M+ MN Type-1 - Thin
./change_font_line_spacing.py \
    ./fonts_in/mplus-1mn-thin.ttf \
    ./fonts_out \
    ${new_ascender} ${new_descender}
# M+ MN Type-1 - Light
./change_font_line_spacing.py \
    ./fonts_in/mplus-1mn-light.ttf \
    ./fonts_out \
    ${new_ascender} ${new_descender}
# M+ MN Type-1 - Regular
./change_font_line_spacing.py \
    ./fonts_in/mplus-1mn-regular.ttf \
    ./fonts_out \
    ${new_ascender} ${new_descender}
# M+ MN Type-1 - Medium
./change_font_line_spacing.py \
    ./fonts_in/mplus-1mn-medium.ttf \
    ./fonts_out \
    ${new_ascender} ${new_descender}
# M+ MN Type-1 - Bold
./change_font_line_spacing.py \
    ./fonts_in/mplus-1mn-bold.ttf \
    ./fonts_out \
    ${new_ascender} ${new_descender}
