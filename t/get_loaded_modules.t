use Test::More 0.95;

use_ok( 'Test::Prereq' );

subtest 'modules' => sub {
	my $modules = Test::Prereq->_get_loaded_modules();

	my $keys = [ grep ! /^CPANPLUS/, sort keys %$modules ];

	my @expected = qw( Module::Info Test::Prereq Test::Prereq::Build );
	unshift @expected, 'Module::Build' if $] =~ m/\A5.008/;

	@expected = sort @expected;

	ok( eq_array( $keys, \@expected ), 'Right modules for modules and tests' )
		or
	diag( "Didn't find right modules!\n\tFound < @$keys >\n\tExpected < @expected >\n" );
	};

done_testing();

__END__

TODO: {
local $TODO = "This interface changed, so these tests are not valid";

my $modules = Test::Prereq->_get_loaded_modules( );
my $okay = defined $modules ? 0 : 1;
ok( $okay, '_get_loaded_modules catches no arguments' );

   $modules = Test::Prereq->_get_loaded_modules( undef, 't' );
$okay = defined $modules ? 0 : 1;
ok( $okay, '_get_loaded_modules catches missing first arg' );

   $modules = Test::Prereq->_get_loaded_modules( 'blib/lib', undef );
$okay = defined $modules ? 0 : 1;
ok( $okay, '_get_loaded_modules catches missing second arg' );

}
