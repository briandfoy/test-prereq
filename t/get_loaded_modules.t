# $Id$

use Test::More tests => 4;

use Test::Prereq;

{
my $modules = Test::Prereq->_get_loaded_modules();

my $keys = [ grep ! /^CPANPLUS/, sort keys %$modules ];

print STDERR "Didn't find right modules! Found < @$keys >\n" unless
ok(
  eq_array( $keys, 
		[ 
		qw( Module::Build Module::CoreList Module::Info 
			Test::Prereq Test::Prereq::Build) 
		] ),
	'Right modules for modules and tests'
	);
}

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
