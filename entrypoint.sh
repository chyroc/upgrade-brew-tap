#!/bin/sh -l

set -ex

env

ls -alh

cd /prj

ls -alh

go run main.go

echo "hello $1"
