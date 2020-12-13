#!/usr/bin/env raku

my @items = $?FILE.IO.dirname.IO.add('input-day-10.txt').slurp.trim.lines.map: *.Int;
#my @items = $?FILE.IO.dirname.IO.add('input-day-10-test-1.txt').slurp.trim.lines.map: *.Int;
#my @items = $?FILE.IO.dirname.IO.add('input-day-10-test-2.txt').slurp.trim.lines.map: *.Int;
die('value < 1') if 0 > @items.any;
@items = @items.push(0, @items.max + 3).sort;

my @vals = @items.rotor(2 => -1).map({ $_[1] - $_[0] });
my $one-diff = @vals.grep(* == 1).elems;
my $three-diff = @vals.grep(* == 3).elems;

say 'Answer: ', $one-diff * $three-diff; # Answer: 2030

say 'Time execution: ', now - INIT now;
