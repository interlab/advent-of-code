#!/usr/bin/env raku

# my @items = $?FILE.IO.dirname.IO.add('input-day-6-test.txt')
  # .slurp.trim.split(/ \n\n+ /).map: *.lines;
my @items = $?FILE.IO.dirname.IO.add('input-day-6.txt')
    .slurp.trim.split(/ \n\n+ /).map: *.lines;

my $nres = 0;

for @items -> $item {
    my @question = $item.map: *.comb;
    my $res = @question.elems == 1
            ?? @question[0].elems
            !! ([(&)] @question).elems; # like in Python: set.intersection(*[set('qwerty'), set('qwerty')])
    if ($res > 0) {
        $nres += $res;
    }
}

say $nres; # 3039
           # 6 on test data

say 'Time execution: ', now - INIT now;
