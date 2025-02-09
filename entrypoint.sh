#!/bin/sh

set -ex

echo "Building project"
make --directory=$1
