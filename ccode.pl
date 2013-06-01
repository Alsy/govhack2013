#!/usr/bin/perl

use strict;
use warnings;

my @row;

open(my $fh, "<", "country_codes.csv");

my ($code,$country);

while (<$fh>) {
    chomp;
    ($code, $country) = split / *\t/;
#    print "$code:$country\n";
    print qq{
insert
into    country
values  ("$code", "$country")
;
};

}

