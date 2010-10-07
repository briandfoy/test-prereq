use strict;
BEGIN{ $^W = 0; }

use Test::More tests => 5;

use Cwd;
use Test::Prereq;
use Test::Prereq::Build;

use lib qw(.);

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
my $modules = Test::Prereq::Build->_get_prereqs();
diag "Didn't find right modules!\nFound <@$modules>\n" unless
	is_deeply( 
		$modules, 
			[ 
			sort qw( Module::Build Module::CoreList Module::Info 
			Test::Builder Test::Builder::Tester Test::Manifest Test::More ) 
			],
		'Right modules for Build.PL'
		);

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
{
my $cwd = cwd;
chdir "testdir" or warn "Could not change directory! $!";
ok( -e 'Makefile.PL', 'Makefile.PL is in the current working directory' );
my $modules = Test::Prereq->_get_prereqs();

isa_ok( $modules, 'ARRAY' );

diag "Didn't find right modules!\nFound <@$modules>\n" unless
	is_deeply( 
		$modules, 
			[ 
			sort qw( HTTP::Size XML::Twig Test::Output Test::Manifest ) 
			],
		'Right modules for Makefile.PL'
		);

chdir $cwd or warn "Could not reset dirctory! $!";
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
{
my $cwd = cwd;
chdir "testdir/bad_makefile" or warn "Could not change directory! $!";
diag( "You might see an error about loading a Makefile.PL. That's fine." );
my $modules = Test::Prereq->_get_prereqs();

my $okay = defined $modules ? 0 : 1;

ok( $okay, 'Bad Makefile.PL fails in right way' );
chdir $cwd or warn "Could not reset dirctory! $!";
}

