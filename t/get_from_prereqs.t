# $Id$
use strict;

use Test::Prereq;
use Test::More tests => 1;

use lib qw(.);

print STDERR "\nThis may take awhile...\n";

my $modules = Test::Prereq->_get_from_prereqs( [ 'Tk' ] );

ok(1);
