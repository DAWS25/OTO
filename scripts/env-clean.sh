#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DIR/.."
echo "script [$0] started"
#!

./mvnw clean

pushd oto-web
rm -rf build .svelte-kit node_modules
popd

#!
popd
echo "script [$0] completed"
