#!/usr/bin/env raku

my @items = $?FILE.IO.dirname.IO.add('input-day-6.txt').slurp.trim.split(/ \n\n+ /);

my $nres = 0;

for @items -> $item {
    $nres += $item.split("\n").join('').comb.unique.elems;
}

say $nres; # 6387

say 'Time execution: ', now - INIT now;
