use ExtUtils::MakeMaker;

WriteMakefile
        (
        'NAME'      => 'Test::Prereq',
        'VERSION'   => '0.05',

		'CONFIGURE_REQUIRES' => {
			'Test::Manifest' => '0',
			},
			
		'BUILD_REQUIRES' => {
			'Test::Output' => '0',
			},

 		'PREREQ_PM' => {
 			'HTTP::Size'      => '0',
 			'XML::Twig'       => '0',
  			},

        'PM' => {
            'lib/Prereq.pm' => '$(INST_LIBDIR)/Prereq.pm',
            },
 
		depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => $tests },
        );

1;
