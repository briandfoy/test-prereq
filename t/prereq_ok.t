use Test::More;
use Test::Prereq;

diag( "Testing Perl version -> $]" );

subtest no_ignore => sub {
	my @ignore = ();
	my $rc = prereq_ok( undef, undef, \@ignore );
	};

done_testing();
