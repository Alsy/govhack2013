#!/usr/bin/perl

use strict;
use warnings;

use DBI;

my $year;
my $sth;
my @trade_types = qw(total export import balance);

my $dbh = DBI->connect(
    'DBI:mysql:test', '', ''
) || die "Could not connect to database: $DBI::errstr";

for my $trade_type (@trade_types) {
    for my $year (2006..2011) {

        my $sth = $dbh->prepare(qq{
            select  country     as title,
                    code        as id,
                    $trade_type as value,
                    concat(
                           "total = ",   format(total/1000,   ","),
                        "M, export = ",  format(export/1000,  ","),
                        "M, import = ",  format(import/1000,  ","),
                        "M, balance = ", format(balance/1000, ","),
                        "M"
                    )           as customData
            from    trade_year
            where   year = $year
            order   by code
        });
         
        $sth->execute();
         
        open(my $title_fh, ">", "title_$trade_type.html");
        print $title_fh "<title>Australian Foreign Trade ($trade_type) $year</title>\n";

        open(my $heading_fh, ">", "heading_$trade_type.html");
        print $heading_fh "<heading>Australian Foreign Trade ($trade_type) $year</heading>\n";

        open(my $data_fh, ">", "data_$trade_type.html");

        while (my @row = $sth->fetchrow_array) {
            my $string = qq(
            {   title: "$row[0] trade (AUD): $row[3]",
                id: "$row[1]",
                value: $row[2],
                customData: "$row[3]" },
            );
            print $data_fh $string;
        }

        $sth = $dbh->prepare(qq{
            select  max($trade_type)      as max_$trade_type,
                    min($trade_type)      as min_$trade_type
            from    trade_year
        });
         
        $sth->execute();
         
        while (my @row = $sth->fetchrow_array) {
            print "max: $row[0], min: $row[1]\n";
            my $string = qq(
            {   id: "max", value: $row[0] },
            {   id: "min", value: $row[1] }
            );
            print $data_fh $string;
        }

        `cat head1.html title_$trade_type.html head2.html heading_$trade_type.html head3.html data_$trade_type.html tail.html > ${trade_type}_$year.html`;
        `open ${trade_type}_$year.html`;
    }
}

$dbh->disconnect();
