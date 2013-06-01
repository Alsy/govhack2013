#!/usr/bin/perl

use strict;
use warnings;

use DBI;

my $dbh = DBI->connect(
    'DBI:mysql:test', '', ''
) || die "Could not connect to database: $DBI::errstr";

my $count = $dbh->do('select * from country');
print "Deleted $count rows\n";

$dbh->disconnect();
