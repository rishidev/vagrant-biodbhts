#!/usr/bin/env bash

#basics
apt-get update
apt-get install -y zlib1g-dev
apt-get install -y bioperl
apt-get install -y git
apt-get install -y build-essential
apt-get install -y emacs23
apt-get install -y cpanminus

#This is for Bio::DB::HTS
cpanm -f Module::Build

#These two are for the VEP
cpanm -f File::Copy::Recursive
cpanm -f Archive::Zip

git config --global user.name "Rishi Nag"
git config --global user.email "rishidev@users.noreply.github.com"


