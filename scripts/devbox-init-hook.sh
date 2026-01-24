#!/usr/bin/env bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd "$DIR/.."
echo "script [$0] started"
#!

# SAM Setup
SAM_URL="https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip"
if ! command -v sam &> /dev/null
then
    echo "AWS SAM CLI not found, installing..."
    wget $SAM_URL -O "/tmp/aws-sam-cli-linux-x86_64.zip"
    unzip /tmp/aws-sam-cli-linux-x86_64.zip -d /tmp/sam-installation
    sudo /tmp/sam-installation/install
    rm -rf /tmp/sam-installation /tmp/aws-sam-cli-linux-x86_64.zip
fi

# Check dependencies versions
aws --version
cdk --version
sam --version
java --version

#!
popd
echo "script [$0] completed"
