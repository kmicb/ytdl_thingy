#!/bin/bash

## Features
#
# Main Menu; using 'case' maybe? Menu options:
# 01 Get URL Info - prompt for url and display data
# 02 Download...
# Video (as is, with audio and video)
# Best Video
# 1080p
# 720p
# Audio Only
# Format
# Quality

# command to download a video file, default options
# yt-dlp <url>

# command to download audio only as aac (m4a)
# yt-dlp -x --audio-format aac <url>
# (audio format options: best (default), aac, alac, flac, m4a, mp3, opus, vorbis, wav))

# command to list formats
# yt-dlp -F <url>

# command to download audio only and choose it's quality
# yt-dlp -x --audio-format aac --audio-quality 0 <url>

# clear screen
clear

# set menu items for case code block
menu_items=(
    "1. Get URL Info"
    "2. Download..."
    "3. TBD"
)

# display the menu
print_menu() {
    max_width=0
    for item in "${menu_items[@]}"; do
        item_length=${#item}
        if ((item_length > max_width)); then
            max_width=$item_length
        fi
    done
    echo ""
    for item in "${menu_items[@]}"; do
        printf "%-${max_width}s\n\n" "$item"
    done
}

# case block
read_option() {
    read -rp "Option: " choice
    case $choice in
    1) # Get URL Info
        ;;
    2) # Download...
        ;;
    3) # TBD
        ;;
    *) # catch-all
        ;;
    esac
}