# $Id$
use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'      => 'Test::Prereq',
        'VERSION'   => '0.05',
 		'PREREQ_PM' => {
 			'HTTP::Size'      => 0,
  			},
        'PM'        => 
        	{
            'lib/Prereq.pm' => '$(INST_LIBDIR)/Prereq.pm',
            },
 
		depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => $tests },
        );

0;
