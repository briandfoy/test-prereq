# $Id$
use ExtUtils::MakeMaker;

sub ExtUtils::MM_Any::test_via_harness
	   {
	   my($self, $perl, $tests) = @_;

	   return qq|\t$perl "-MTest::Manifest" | .
				  qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
				  qq|'\$(INST_ARCHLIB)')"\n|;
	   }

WriteMakefile
		(
		'NAME'            => 'Test::Prereq',
		'VERSION_FROM'    => 'lib/Prereq.pm',
		'PREREQ_PM' => {
			'File::Find::Rule'      => '0',
			'Module::Build'         => '0',
			'Module::CoreList'      => '0',
			'Module::Info'          => '0',
			'Test::Builder'         => '0',
			'Test::Builder::Tester' => '0',
			'Test::Manifest'        => '0.9',
			'Test::More'            => '0',
			'Test::Pod'             => '0',
			},
        'PM'        => 
			{
			'lib/Prereq.pm'  => '$(INST_LIBDIR)/Prereq.pm',
			'lib/Build.pm'   => '$(INST_LIBDIR)/Prereq/Build.pm',
			},

		depend => { Makefile => 't/test_manifest' },
		clean  => { FILES => 'Test-Prereq-*' },
		);

1;
