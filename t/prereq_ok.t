use Test::Prereq;

my @ignore = qw(CPANPLUS::Internals::System);
push @ignore, qw(Module::Build) if $] =~ /\A5\.008/;

my $rc = prereq_ok( undef, undef, \@ignore );

unless( $rc ) {
	require Module::CoreList;

	diag( "Test failed: Perl version is $]" );

	diag( "Missing Module::CoreList entry for $]" )
		unless exists $Module::CoreList::version{ $] };
	}
