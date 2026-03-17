function ytm-playlist-download -d "Downloads a single playlist on YouTube."
    yt-dlp \
    -o "[%(uploader)s] %(title)-s.%(ext)s" \
    -f ba \
    -x \
    --cookies-from-browser vivaldi \
    --audio-format mp3 \
    --embed-thumbnail \
    --embed-metadata \
    --download-archive .list \
    "https://music.youtube.com/playlist?list=$argv[1]"
end

function create-dir-and-download-music
    set back $(pwd)
    cddir $argv[1]
    ytm-playlist-download $argv[2]
    cd $back
end

function ytm-download -d "Downloads Lyrics, No Lyrics, and Chill Music to current directory in such named folders."
    set lyrics 'PLNXPMSzcL56H7OBjUviOyjnwu0YLONb9Q'
    set nolyrics 'PLNXPMSzcL56FRHedbSsY6ekjRmI0oO7Z5'
    set chill 'LNXPMSzcL56Gvn_-omLC_XyM7dRrYeX3L'
    
    cd /home/crystal/Music

    create-dir-and-download-music "Lyrics" $lyrics
    create-dir-and-download-music "No Lyrics" $nolyrics
    create-dir-and-download-music "Chill Music" $chill
end

