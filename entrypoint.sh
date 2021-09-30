#!/bin/sh -l

set -ex

env

tag_v="${GITHUB_REF#refs/*/}"
tag=`echo $tag_v | cut -c2-`
name="$INPUT_NAME"
tap_repo="$INPUT_TAP_REPO"
token="$INPUT_TOKEN"
repo="$GITHUB_REPOSITORY"

checksum_url="https://github.com/$repo/releases/download/v$tag/checksums.txt"
checksum=`curl -sL $checksum_url | grep $name-$tag.tar.gz | cut -d ' '  -f 1-1 | xargs`

echo "name: $name"
echo "tag: $tag"
echo "checksum: $checksum"
echo "tap_repo: $tap_repo"

echo "::set-output name=name::$name"
echo "::set-output name=tag::$tag"
echo "::set-output name=checksum::$checksum"
echo "::set-output name=tap_repo::$tap_repo"

git clone "https://username:$token@github.com/$tap_repo" "/tmp/$tap_repo"
cd /tmp/$tap_repo

sed "s#^  url.*#  url \"https://github.com/$repo/releases/download/v$tag/$name-$tag.tar.gz\"#" "./Formula/$name.rb" > "./Formula/$name.rb"
sed "s#^  sha256.*#  sha256 \"$checksum\"#" "./Formula/$name.rb" > "./Formula/$name.rb"

git config --global user.name 'github-actions[bot]'
git config --global user.email '41898282+github-actions[bot]@users.noreply.github.com'
git commit -a -m "upgrade $name to v$tag"
git push
