# $Id$
BEGIN {
	@classes = qw(Test::Prereq);
	}

use Test::More tests => scalar @classes;

foreach my $class ( @classes )
	{
	print "bail out! Could not compile $class!" unless use_ok( $class );
	}
