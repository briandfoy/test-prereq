use ExtUtils::MakeMaker 6.64;

require 5.008;

eval "use Test::Manifest 1.21";

WriteMakefile(
	'NAME'          => 'Test::Prereq',
	'ABSTRACT'      => 'Ensure a build file lists all pre-requisites',
	'VERSION_FROM'  => 'lib/Test/Prereq.pm',
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',

	'NORECURS'      => 1,

	'BUILD_REQUIRES' => {
		'ExtUtils::MakeMaker'    => '6.64',
		},

	'TEST_REQUIRES' => {
		'Test::Builder'          => '0',
		'Test::Builder::Tester'  => '0',
		'Test::More'             => '0.95',
		},

	'PREREQ_PM'	    => {
		'Module::CoreList'       => '0',
		'Module::Info'           => '0',
		},

	'clean' => { FILES => 'Test-Prereq-*' },

	'META_MERGE' => {
        'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'git@github.com:briandfoy/test-prereq.git',
				web  => 'https://github.com/briandfoy/test-prereq',
				},
			},
		},
	);
