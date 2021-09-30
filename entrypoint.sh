#!/bin/sh -l

set -ex

env

tag_v="${GITHUB_REF#refs/*/}"
tag="0.3.0" # `echo $tag_v | cut -c2-`
name="$INPUT_NAME"
repo="otp-cli" # "$GITHUB_REPOSITORY"

checksum_url="https://github.com/$repo/releases/download/v$tag/checksums.txt"
checksum=`curl -sL $checksum_url | grep $name-$tag.tar.gz | cut -d ' '  -f 1-1 | xargs`

echo "tag: $tag"
echo "checksum: $checksum"
echo "name: $name"
