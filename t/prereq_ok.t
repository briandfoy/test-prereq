use Test::More;
use Test::Prereq;

diag( "Testing Perl version -> $]" );

diag( "Missing Module::CoreList entry for $]" )
	unless exists $Module::CoreList::version{ $] };

my @ignore = qw(CPANPLUS::Internals::System);
push @ignore, qw(Module::Build) if $] =~ /\A5\.008/;

my $rc = prereq_ok( undef, undef, \@ignore );

done_testing();
