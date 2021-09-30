#!/bin/sh -l

set -ex

env

tag_v="${GITHUB_REF#refs/*/}"
tag=`echo $tag_v | cut -c2-`
name="$INPUT_NAME"

checksum_url="https://github.com/chyroc/otp-cli/releases/download/$tag/checksums.txt"
checksum=`curl -sL $checksum_url | grep $name-$tag.tar.gz | cut -d ' '  -f 1-1 | xargs`

echo "tag: $tag"
echo "checksum: $checksum"
echo "name: $name"
