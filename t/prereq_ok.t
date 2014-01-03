use Test::Prereq;

my @ignore = qw(CPANPLUS::Internals::System);
push @ignore, qw(Module::Build) if $] =~ /\A5\.008/;
prereq_ok( undef, undef, \@ignore );
