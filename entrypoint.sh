#!/bin/sh -l

set -ex

env

ls -alh

cd /prj

ls -alh

/usr/local/go/bin/go run main.go

echo "hello $1"
