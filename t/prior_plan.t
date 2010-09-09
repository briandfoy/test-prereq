use Test::More tests => 2;

use Test::Prereq::Build;
prereq_ok( undef, undef, [ qw(CPANPLUS::Internals::System) ] );
ok(1);
