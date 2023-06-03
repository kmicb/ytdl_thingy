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
# opt02 should ask if they want to download the video file as is or just extract the audio \
# and if they want just the audio, prompt for which format and what quality to download it \
# if they want to download the video as is, do that part
# add code to else block if q_as_is == [Nn]*

# clear screen
clear

# set menu items for case code block
menu_items=(
    "1. Get URL Info"
    "2. Download..."
    "3. TBD"
    "9. Exit"
)

# functions
is_url_valid() {
    local url="$1"
    local regex="^(https?|ftp)://[^\s/$.?#].[^\s]*$"
    if [[ "$url" =~ $regex ]]; then
        return 0 # URL is valid
    else
        return 1 # URL is invalid
    fi
}

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
            # regex="^(https?|ftp)://[^\s/$.?#].[^\s]*$"
            if is_url_valid "$q_url"; then
                echo ""
                yt-dlp -F "$q_url"
                echo ""
                break
            else
                echo ""
                read -rp "Invalid URL. Try again? (y/n): " choice
                echo ""
                if [[ "$choice" == [Nn]* ]]; then
                    echo "Aborting script."
                    echo ""
                    exit 0
                fi
            fi
        done
        read -rp "[M]ain Menu or [Q]uit: " choice
        echo ""
        if [[ "$choice" == [Mm]* ]]; then
            clear
            # print_menu
        elif [[ "$choice" == [Qq]* ]]; then
            echo "Aborting script."
            echo ""
            exit 0
        else
            echo "Invalid choice. Going back to main menu."
            print_menu
        fi
        ;;
    2) # Download...
        while true; do
            read -rp "URL? " q_url
            if is_url_valid "$q_url"; then
                echo ""
                read -rp "Download video file as-is? (no special options) (y/n): " q_as_is
                echo ""
                if [[ "$q_as_is" == [Yy]* ]]; then
                    echo ""
                    echo "Downloading video file as-is..."
                    echo ""
                    yt-dlp "$q_url"
                    echo ""
                    break
                else
                    echo "Hi"
                    echo ""
                    break
                    # do something if q_as_is == [Nn]*
                fi
            else
                echo ""
                read -rp "Invalid URL. Try again? (y/n): " choice
                echo ""
                if [[ "$choice" == [Nn]* ]]; then
                    echo "Aborting script."
                    echo ""
                    exit 0
                fi
            fi
        done
        read -rp "[M]ain Menu or [Q]uit: " choice
        echo ""
        if [[ "$choice" == [Mm]* ]]; then
            clear
        elif [[ "$choice" == [Qq]* ]]; then
            echo "Aborting script."
            echo ""
            exit 0
        else
            echo "Invalid choice; going back to main menu."
            echo ""
        fi
        ;;
    3) # TBD
        ;;
    9)  # Exit
        exit 0
        ;;
    *) # catch-all
        echo "Invalid selection."
        ;;
    esac
}

while true; do
    print_menu
    echo ""
    read_option
    echo ""
done