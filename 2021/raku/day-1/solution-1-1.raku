#!/usr/bin/env raku

# my @items = $?FILE.IO.dirname.IO.add('input-day-1-test.txt').slurp.trim.lines;
my @items = $?FILE.IO.dirname.IO.add('input-day-1.txt').slurp.trim.lines;
# say @items;

my $res = @items.&{ $_ Z< .skip }>>.Int.sum;

say 'Answer: ', $res; # Answer: 7 (test)
                      # Answer: 1624

say 'Time execution: ', now - INIT now;
