# $Id$

use Test::Pod::Coverage tests => 2;
pod_coverage_ok( "Test::Prereq" );

pod_coverage_ok( "Test::Prereq::Build",
	{ trustme => [ qr/create_build_script|prereq_ok/ ] } );