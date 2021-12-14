#!/usr/bin/env raku

my $nres = [+] $?FILE.IO.dirname.IO
    .add('input-day-6.txt').slurp.trim.split(/ \n\n+ /)
    .map: *.lines.join('').comb.unique.elems;

say $nres; # 6387

say 'Time execution: ', now - INIT now;
