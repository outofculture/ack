#!/usr/bin/perl

use warnings;
use strict;

use Test::More tests => 2;
use File::Next 0.34; # for reslash function

use lib 't';
use Util;

prep_environment();

BEFORE_REGEX: {
    my @expected = split( /\n/, <<'EOF' );
Well, I grew up quick and I grew up mean,
--
But I made me a vow to the moon and stars
EOF

    my $regex = 'stars';
    my @files = qw( t/text/boy-named-sue.txt );
    my @args = ( '--text', '--before-context-regex=Well', $regex );

    ack_lists_match( [ @args, @files ], \@expected, "Looking for $regex - before" );
}
