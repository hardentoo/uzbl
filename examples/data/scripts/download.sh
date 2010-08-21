#!/bin/sh
# just an example of how you could handle your downloads
# try some pattern matching on the uri to determine what we should do

source $UZBL_UTIL_DIR/uzbl-dir.sh

# Some sites block the default wget --user-agent..
GET="wget --user-agent=Firefox --content-disposition --load-cookies=$UZBL_COOKIE_JAR"

url="$8"

http_proxy="$9"
export http_proxy

test "x$url" = "x" && { echo "you must supply a url! ($url)"; exit 1; }

# only changes the dir for the $get sub process
if echo "$url" | grep -E '.*\.torrent' >/dev/null; then
    ( cd "$UZBL_DOWNLOAD_DIR"; $GET "$url")
else
    ( cd "$UZBL_DOWNLOAD_DIR"; $GET "$url")
fi
