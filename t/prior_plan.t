# $Id$

use Test::More tests => 2;

use Test::Prereq;
prereq_ok( undef, undef, [ qw(CPANPLUS::Internals::System) ] );
ok(1);