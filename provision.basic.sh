#!/usr/bin/env bash

#basics
apt-get update
apt-get install -y zlib1g-dev
apt-get install -y bioperl
apt-get install -y git
apt-get install -y build-essential
apt-get install -y emacs23
apt-get install -y cpanminus
cpanm -f Module::Build

git config --global user.name "Rishi Nag"
git config --global user.email "rishidev@users.noreply.github.com"


