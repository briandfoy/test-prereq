# $Id$
use ExtUtils::MakeMaker;

my $tests = do {
	local @ARGV = qw(t/test_manifest);
	my $data = join " ", map {chomp; "t/$_" } <>;
	};

WriteMakefile
		(
		'NAME'      => 'Test::Prereq',
		'VERSION'   => '0.11',
		'PREREQ_PM' => {
			'File::Find::Rule'      => '0',
			'Module::Build'         => '0',
			'Module::Info'          => '0',
			'Module::CoreList'      => '0',
			'Test::More'            => '0',
			'Test::Pod'             => '0',
			'Test::Builder::Tester' => '0',
			'Test::Builder'         => '0',
			},
        'PM'        => 
			{
			'lib/Prereq.pm'  => '$(INST_LIBDIR)/Prereq.pm',
			'lib/Build.pm'   => '$(INST_LIBDIR)/Prereq/Build.pm',
			},

		depend => { Makefile => 't/test_manifest' },
		test   => { TESTS => $tests },
		);

