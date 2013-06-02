#!/usr/bin/perl

use strict;
use warnings;

use DBI;

my ($year, $trade_type
my $dbh = DBI->connect(
    'DBI:mysql:test', '', ''
) || die "Could not connect to database: $DBI::errstr";

$year = 2006;
$trade_type = 'total';

my $sth = $dbh->prepare("
    select  code        as id,
            $trade_type as value
    from    trade_year
    where   year = $year
    order   by code
");
 
$sth->execute();
 
open(my $fh, ">", "data_$trade_type.html");

while (my @row = $sth->fetchrow_array) {
  print $fh "{ id: \"$row[0]\", value: $row[1] },\n";
}

`cat head.html data.html tail.html > $trade_type.html`;
`open $trade_type.html`;

$dbh->disconnect();
