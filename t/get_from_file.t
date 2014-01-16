use Test::More 0.95;

use Test::Prereq;

my @prereq_files = qw( Module::Info );
push @prereq_files, qw( Module::CoreList ) if $] =~ /\A5\.008/;

my @tests = (
	[ 't/pod.t',            [ ]                 ],
	[ 'lib/Test/Prereq.pm', [ @prereq_files ]   ],
	);

foreach my $test ( @tests ) {
	my( $file, $expected ) = @$test;

	subtest pod => sub {
		my $modules = from_file( $file );

		diag "Did not find right modules for $file!\nFound <@$modules>\n" 
			unless is_deeply( $modules, $expected,
					"Found the expected modules for $file"
					);
		};
	}

sub from_file {
	my( $file ) = @_;
	
	my $modules = Test::Prereq->_get_from_file( $file );
	my @modules = grep ! /^CPANPLUS/, @$modules;

	return \@modules;
	}

done_testing();
