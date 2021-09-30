#!/bin/sh -l

set -ex

env

tag="${GITHUB_REF#refs/*/}"

echo "tag: $tag"

echo "hello $1"
