#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DIR/.."
#!

source ./env-build.sh

aws sts get-caller-identity

pushd oto-sam
sam init
STACK_NAME="$ENV_ID-stack"
sam depoly --resolve-s3 --stack-name "$STACK_NAME" --capabilities CAPABILITY_NAMED_IAM 
popd

#!
popd
