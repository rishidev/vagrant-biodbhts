#!/usr/bin/env bash

#basics
apt-get update
apt-get install -y zlib1g-dev
apt-get install -y bioperl
apt-get install -y git
apt-get install -y build-essential
apt-get install -y emacs23
apt-get install -y cpanminus
apt-get install -y unzip
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


