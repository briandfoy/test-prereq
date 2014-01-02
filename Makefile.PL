use ExtUtils::MakeMaker 6.46;

require 5.008;

eval "use Test::Manifest 1.21";

WriteMakefile(
	'NAME'          => 'Test::Prereq',
	'ABSTRACT'      => 'Ensure a build file lists all pre-requisites',
	'VERSION_FROM'  => 'lib/Test/Prereq.pm',
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',

	'PREREQ_PM'	    => {
		'Module::Build'          => '0',
		'Module::CoreList'       => '0',
		'Module::Info'           => '0',
		'Test::Builder'          => '0',
		'Test::Builder::Tester'  => '0',
		'Test::More'             => '0.95',
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
