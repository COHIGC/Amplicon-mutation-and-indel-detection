#!/usr/bin/perl -w
use strict;

open (IN, "<$ARGV[0]") or die "Cannot open the input file: $ARGV[0]!\n";
open (OUT, ">$ARGV[1]") or die "Cannot open the output: $ARGV[1]!\n";

my $line_counter=0;

while (<IN>){
	my $line=$_;
	$line_counter++;
	if ($line_counter%2!=0){
		$line=~s/\n//g;
			print OUT $line;
	}
	else {
		print OUT $line;
	}
}
close IN;
close OUT;
