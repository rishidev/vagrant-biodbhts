#!/usr/bin/env bash

#basics
dnf install -y zlib1g-dev
dnf install -y bioperl
dnf install -y git
dnf install -y build-essential
dnf install -y emacs23
dnf install -y cpanminus
cpanm -f Module::Build

#get Bio::DB::HTS installed
git clone https://github.com/samtools/htslib.git
cd htslib
git checkout master
perl -e "open my $in, '<','Makefile';
open my $out,'>','Makefile.new';
while (<$in>) {
    chomp;
    if (/^CFLAGS/ && !/-fPIC/) {
	s/#.+//;  # get rid of comments
	$_ .= \" -fPIC -Wno-unused -Wno-unused-result\";
    }
} continue {
    print $out $_,"\n";
}

close $in;
close $out;
rename 'Makefile.new','Makefile' ; "
make
make install
cd ..


#get Bio::DB::HTS installed - from GitHub 
git clone https://github.com/Ensembl/Bio-HTS.git
cd Bio-HTS
#git checkout release/cpan107
perl Build.PL
./Build
./Build test
./Build install

#From CPAN
#cpanm Bio::DB::HTS


