# $Id$
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'            => 'Test::Prereq',
	'VERSION_FROM'    => 'lib/Prereq.pm',
	'ABSTRACT'        => 'check if Makefile.PL has the right pre-requisites',	
	'LICENSE'   	  => 'perl',
	'AUTHOR'          => 'brian d foy <bdfoy@cpan.org>',

	'PREREQ_PM' => {
		'Module::Build'         => '0',
		'Module::CoreList'      => '0',
		'Module::Info'          => '0',
		'Test::Builder'         => '0',
		'Test::Builder::Tester' => '0',
		'Test::More'            => '0',
		},

	'PM'        => 
		{
		'lib/Prereq.pm'  => '$(INST_LIBDIR)/Prereq.pm',
		'lib/Build.pm'   => '$(INST_LIBDIR)/Prereq/Build.pm',
		},

	'MAN3PODS' =>
		{
		'lib/Prereq.pm' => '$(INST_MAN3DIR)/Test::Prereq.3',
		'lib/Build.pm'  => '$(INST_MAN3DIR)/Test::Prereq::Build.3',
		},

	clean  => { FILES => 'Test-Prereq-*' },
	);

1;
