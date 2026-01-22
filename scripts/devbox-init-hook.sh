#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DIR/.."
echo "script [$0] started"
#!

# Check if aws sam cli is installed, install if not
if ! command -v sam &> /dev/null
then
    echo "AWS SAM CLI not found, installing..."
    wget "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -O "aws-sam-cli-linux-x86_64.zip"
    unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
    sudo ./sam-installation/install
    rm -rf sam-installation aws-sam-cli-linux-x86_64.zip
fi

# Check dependencies versions
aws --version
cdk --version
sam --version
java --version

#!
popd
echo "script [$0] completed"
