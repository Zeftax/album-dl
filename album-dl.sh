#!/bin/sh

#request the url of the playlist
echo -n 'playlist url: '
read url

#request the name of the artist
echo -n 'artist name: '
read artist

#request the name of the album
echo -n 'album name: '
read album

mkdir "${album}"
cd "${album}"

#stack overflow said this would fix a 403 error that youtube-dl sometimes throws at me
#youtube-dl --rm-cache-dir

#download the files using youtube-dl
yt-dlp -o "%(playlist_index)sඞ%(title)s.%(ext)s" --extract-audio --audio-format mp3 "$url"

#loop through all files
for file in *
do
	#split the filename by the sussy symbol. take the 0th element and store it as the track number for mp3. then concatenate the rest back together and rename the file
	IFS='ඞ'
	read -a arrfile <<< $file
	track="${arrfile[0]}"
	arrfile=("${arrfile[@]:1}")
	newfilename=''
	for namepart in "${arrfile[@]}";
	do
		newfilename+="$namepart"
	done
	mv "$file" "$newfilename"
	file="$newfilename"

	#use ffmpeg to set the title, artist, track number, and album name to a new file, then rewrite the old file with the new file
	ffmpeg -i "$file" -metadata title="$file" -metadata artist="$artist" -metadata album="$album" -metadata track="$track" "${file}_changed.mp3"
	mv "${file}_changed.mp3" "$file"
done
