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
# yt-dlp https://youtu.be/48fzJttqb4Q

# command to download audio only as aac (m4a)
# yt-dlp -x --audio-format aac <url>
# (audio format options: best (default), aac, alac, flac, m4a, mp3, opus, vorbis, wav))

# command to list formats
# yt-dlp -F <url>

# command to download audio only and choose it's quality
# yt-dlp -x --audio-format aac --audio-quality 0 <url>

## Notes
# variables that start with 'q_' are assigned by user input via 'read -rp'
# menu option 1: add logic to check that the url is a proper url; make new branch for this
# add prompt to ask if go back to main menu or quit after something runs and completes

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
    echo ""
    for item in "${menu_items[@]}"; do
        echo "$item"
        echo ""
    done
    echo ""
}

# case block
# Function to read user option
read_option() {
    read -rp "Option: " choice
    echo ""
    case $choice in
    1) # Get URL Info
        while true; do
            read -rp "URL? " q_url
            regex="^(https?|ftp)://[^\s/$.?#].[^\s]*$"
            if [[ "$q_url" =~ $regex ]]; then
                echo ""
                yt-dlp -F "$q_url"
                echo ""
                break
            else
                echo ""
                read -rp "Invalid URL. Try again? (y/n): " choice
                echo ""
                if [[ "$choice" == "n" ]]; then
                    echo "Aborting script."
                    echo ""
                    exit 0
                fi
            fi
        done
        ;;
    2) # Download...
        ;;
    3) # TBD
        ;;
    *) # catch-all
        echo "Invalid selection."
        ;;
    esac
}

print_menu
echo ""
read_option
echo ""