# $Id$
package Test::Prereq::Build;
use strict;

use base qw(Test::Prereq);
use vars qw($VERSION);

=head1 NAME

Test::Prereq::ModuleBuild - test prerequisites in Module::Bulid scripts

=head1 SYNOPSIS

   use Test::Prereq::Build;
   prereq_ok();

=cut

$VERSION = '0.03';

use Module::Build;

=head1 METHODS

This module overrides methods in Test::Prereq to make it work with
Module::Build.

This module does not have any public methods.  See L<Test::Prereq>.

=head1 AUTHOR

brian d foy, E<lt>bdfoy@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright 2002 brian d foy, All rights reserved

You can use this software under the same terms as Perl itself.

=cut

sub Module::Build::Base::create_build_script 
	{
	my $self = shift;
	
	my %requires = (
		%{ $self->{properties}{requires} },
		%{ $self->{properties}{build_requires} },
		);

	delete $requires{perl};

	@Test::Prereq::prereqs = sort keys %requires;
	}

sub _master_file { 'Build.PL' }

1;
