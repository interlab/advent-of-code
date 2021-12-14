#!/usr/bin/env raku

# my $filename = 'input-day-1-test.txt';
my $filename = 'input-day-1.txt';

my @items = $?FILE.IO.dirname.IO.add($filename).slurp.trim.lines;
# say @items;

my $res = @items.&{ $_ Z< .skip }>>.Int.sum;

say 'Answer: ', $res; # Answer: 7 (test)
                      # Answer: 1624

say 'Time execution: ', now - INIT now;
