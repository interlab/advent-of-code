#!/usr/bin/env raku

# without .trim will stupid monkey error
my @items = $?FILE.IO.dirname.IO.add('input-day-6.txt').slurp.trim.split(/ \n\n+ /).map: *.lines;

my $ncount = 0;

for @items -> $item {
    my @question = $item.map: *.comb;
    my $nelems = ( [(&)] @question ).elems; # like in Python: set.intersection(*[set('qwerty'), set('qwerty')])
    if ($nelems > 0) {
        $ncount += $nelems;
    }
}

say $ncount; # 3039

say 'Time execution: ', now - INIT now;
