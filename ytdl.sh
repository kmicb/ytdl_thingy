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