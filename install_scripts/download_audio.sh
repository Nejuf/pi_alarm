#!/bin/bash
# Downloads sample audio files to "audio" directory.

SCRIPT_DIR=`dirname $0`

pushd() {
  command pushd "$@" >/dev/null
}
popd() {
  command popd "$@" >/dev/null
}

pushd "$SCRIPT_DIR/../audio"

echo "Downloading audio files..."

curl -O http://www.orangefreesounds.com/wp-content/uploads/2017/01/Relaxing-ambient-music.zip
unzip Relaxing-ambient-music.zip *.mp3 
rm Relaxing-ambient-music.zip

popd

echo "Download complete"

