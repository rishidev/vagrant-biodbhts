#!/usr/bin/env bash

#basics
dnf update
dnf install -y zlib1g-dev
dnf install -y bioperl
dnf install -y git
dnf install -y build-essential
dnf install -y emacs23
dnf install -y cpanminus

#This is for Bio::DB::HTS
cpanm -f Module::Build

#These two are for the VEP
cpanm -f File::Copy::Recursive
cpanm -f Archive::Zip

