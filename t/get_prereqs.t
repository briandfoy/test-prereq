# $Id$
use strict;
BEGIN{ $^W = 0; }

use Test::More tests => 4;

use Cwd;
use Test::Prereq;
use Test::Prereq::Build;


use lib qw(.);

my $modules = Test::Prereq->_get_prereqs();
print STDERR "Didn't find right modules!\nFound <@$modules>\n" unless
ok( eq_array( $modules, 
		[ 
		qw( Module::Build Module::CoreList Module::Info 
		Test::Builder Test::Builder::Tester Test::More ) 
		] ),
	'Right modules for Makefile.PL'
	);

{
my $cwd = cwd;
chdir "testdir" or warn "Could not change directory! $!";
my $modules = Test::Prereq::Build->_get_prereqs();

isa_ok( $modules, 'ARRAY' );

ok(
  eq_array( $modules, 
		[ 
		qw( Config Cwd Data::Dumper File::Basename File::Copy File::Find 
		File::Path File::Spec ) 
		] ),
	'Right modules for Build.PL'
	);

chdir $cwd or warn "Could not reset dirctory! $!";
}

{
my $cwd = cwd;
chdir "testdir/bad_makefile" or warn "Could not change directory! $!";
my $modules = Test::Prereq->_get_prereqs();

my $okay = defined $modules ? 0 : 1;

ok( $okay, 'Bad Makefile.PL fails in right way' );
chdir $cwd or warn "Could not reset dirctory! $!";
}

