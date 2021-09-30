#!/bin/sh -l

set -ex

env

tag_v="${GITHUB_REF#refs/*/}"
tag="0.3.0" # `echo $tag_v | cut -c2-`
name="$INPUT_NAME"
tap_repo="$INPUT_TAP_REPO"
repo="chyroc/otp-cli" # "$GITHUB_REPOSITORY"

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

git clone "https://user:$GITHUB_TOKEN@github.com/$tap_repo" "/tmp/$tap_repo"
git config --global user.name 'github-actions[bot]'
git config --global user.email '41898282+github-actions[bot]@users.noreply.github.com'
cd /tmp/$tap_repo
echo '# x' >> ./Formula/dl.rb
git commit -a -m "commit"
git push
