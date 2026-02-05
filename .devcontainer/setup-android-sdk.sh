#!/usr/bin/env bash
set -e

sudo apt-get update
sudo apt-get install -y wget unzip

ANDROID_SDK_ROOT=$HOME/android-sdk
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools

cd /tmp
wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdtools.zip
unzip -q cmdtools.zip

mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest
mv cmdline-tools/* $ANDROID_SDK_ROOT/cmdline-tools/latest/

export ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

yes | $ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager --licenses

$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager \
  "platform-tools" \
  "platforms;android-34" \
  "build-tools;34.0.0"

echo "export ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT" >> ~/.bashrc
echo "export PATH=\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:\$ANDROID_SDK_ROOT/platform-tools:\$PATH" >> ~/.bashrc
