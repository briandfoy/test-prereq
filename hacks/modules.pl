#!/usr/bin/perl

use Module::Info;
use Module::CoreList;

my $lowest_version = 5.006001;

my @versions = keys %Module::CoreList::version;

{
local $" = "\n\t";
print "versions are\n\t@versions\n";
}

my $core = $Module::CoreList::version{$lowest_version};


my $module = Module::Info->new_from_module('Business::ISBN');
my $file = Module::Info->new_from_file('/Users/brian/Dev/Business/ISBN/t/pod.t');

foreach my $used ( $module->modules_used )
	{
	print "used $used";
	
	print " --> core" if exists $core->{$used};
	
	print "\n";
	}

print "-" x 53, "\n";

foreach my $used ( $file->modules_used )
	{
	print "used $used";
	
	print " --> core" if exists $core->{$used};
	
	print "\n";
	}

print "-" x 53, "\n";

use ExtUtils::MakeMaker;

sub ExtUtils::MakeMaker::WriteMakefile
	{
	my %hash = @_;
	
	my $hash = $hash{PREREQ_PM};
	
	foreach my $module ( keys %$hash )
		{
		print "PREREQ: $module\n";
		}
	
	return $hash;	
	}

require './Makefile.PL';
