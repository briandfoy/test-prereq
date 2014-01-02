use Test::More 0.95;

use Test::Prereq;

my $modules = Test::Prereq->_get_from_file( 't/pod.t' );
my @modules = grep ! /^CPANPLUS/, @$modules;

diag "Did not find right modules from t/pod.t!\n" .
	"Found <@modules>\n" unless
	ok(
		eq_array( \@modules, [] ),
			'Right modules for t/pod.t'
			);

$modules = Test::Prereq->_get_from_file( 'lib/Test/Prereq.pm' );
@modules = grep ! /^CPANPLUS/, @$modules;

diag "Did not find right modules for lib/Test/Prereq.pm!\n" .
	 "Found <@modules>\n" unless
		ok(
			eq_array( \@modules, [ 
			qw( Module::Info ) ] ),
			'Right modules for lib/Test/Prereq.pm'
			);

done_testing();
