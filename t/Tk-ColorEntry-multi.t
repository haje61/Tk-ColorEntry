use strict;
use warnings;
use Test::More tests => 4;
use Test::Tk;
require Tk::Balloon;
use Tk;

BEGIN {
	use_ok('Tk::ColorEntry');
	use_ok('Tk::PopColor');
};

createapp;

my $entry;
my $pop;
if (defined $app) {
	my $balloon = $app->Balloon;
	my $frame = $app->Frame(
		-width => 200,
		-height => 100,
	)->pack(-fill => 'both');
	my $l = $frame->Label(
		-width => 20,
		-height => 2,
	)->pack(
		-fill => 'both',
	);
#	$entry = $frame->ColorEntry(
#		-balloon => $balloon,
#		-command => sub { $l->configure(-background => shift) },
#		-depthselect => 1,
#		-indicatorwidth => 4,
#		-historyfile => 't/colorentry_history',
#	)->pack(
#		-fill => 'x',
#	);
	$pop = $app->PopColor(
		-depthselect => 1,
		-widget => '',
	);
	for (1 .. 25) {
		my $e = $frame->ColorEntry(
			-balloon => $balloon,
			-command => sub { $l->configure(-background => shift) },
#			-depthselect => 1,
			-indicatorwidth => 4,
			-historyfile => 't/colorentry_history',
			-popcolor => $pop,
		)->pack(
			-fill => 'x',
		);
#		$pop = $e->cget('-popcolor') unless defined $pop;
	}
	$frame->Entry->pack;
}



starttesting;
