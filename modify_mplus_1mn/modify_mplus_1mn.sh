#!/bin/bash

thin_mplus_1mn="mplus-1mn-thin.ttf"
light_mplus_1mn="mplus-1mn-light.ttf"
regular_mplus_1mn="mplus-1mn-regular.ttf"
medium_mplus_1mn="mplus-1mn-medium.ttf"
bold_mplus_1mn="mplus-1mn-bold.ttf"

thin_mplus_1m="mplus-1m-thin.ttf"
light_mplus_1m="mplus-1m-light.ttf"
regular_mplus_1m="mplus-1m-regular.ttf"
medium_mplus_1m="mplus-1m-medium.ttf"
bold_mplus_1m="mplus-1m-bold.ttf"

thin_multibyte="GenEiGothicM-ExtraLight.ttf"
light_multibyte="GenEiGothicM-Light.ttf"
regular_multibyte="GenEiGothicM-Regular.ttf"
medium_multibyte="GenEiGothicM-SemiBold.ttf"
bold_multibyte="GenEiGothicM-Bold.ttf"

function modify_fonts()
{
    mplus_1mn_file="$1"
    mplus_1m_file="$2"
    multibyte_file="$3"
    dest_dir="$4"
    ./modify_mplus_1mn.py "${mplus_1mn_file}" "${mplus_1m_file}" "${multibyte_file}" "${dest_dir}"
}

src_dir="./fonts_in"
dest_dir="./fonts_out"

# Thin
echo "${src_dir}/${thin_mplus_1mn}" "${src_dir}/${thin_mplus_1m}" "${src_dir}/${thin_multibyte}" "${dest_dir}"
modify_fonts "${src_dir}/${thin_mplus_1mn}" "${src_dir}/${thin_mplus_1m}" "${src_dir}/${thin_multibyte}" "${dest_dir}"

# Light
modify_fonts "${src_dir}/${light_mplus_1mn}" "${src_dir}/${light_mplus_1m}" "${src_dir}/${light_multibyte}" "${dest_dir}"

# regular
modify_fonts "${src_dir}/${regular_mplus_1mn}" "${src_dir}/${regular_mplus_1m}" "${src_dir}/${regular_multibyte}" "${dest_dir}"

# medium
modify_fonts "${src_dir}/${medium_mplus_1mn}" "${src_dir}/${medium_mplus_1m}" "${src_dir}/${medium_multibyte}" "${dest_dir}"

# bold
modify_fonts "${src_dir}/${bold_mplus_1mn}" "${src_dir}/${bold_mplus_1m}" "${src_dir}/${bold_multibyte}" "${dest_dir}"
