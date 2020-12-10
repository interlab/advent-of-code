#!/usr/bin/env raku

my @items = $?FILE.IO.dirname.IO.add('input-day-9.txt').IO.slurp.trim.lines;
#my @items = $?FILE.IO.dirname.IO.add('input-day-9-test.txt').IO.slurp.trim.lines.map: *.Int;
@items =  @items.map: *.Int;

#my Int $preambula = 5; # for test data
my Int $preambula = 25;

my Int @numbers = @items[$preambula..*-1];

sub get-variants(@nums) {
    my Int @variants;
    for @nums -> $v1 {
        for @nums -> $v2 {
            next if $v1 == $v2;
            @variants.push($v1 + $v2) if ($v1 + $v2) !(elem) @variants;
        }
    }
    @variants;
}

for @numbers.kv -> $ind, $val {
    my $check = $val (elem) get-variants(@items[$ind..^($ind + $preambula)]);
    say 'bad value: in index ', $ind, ' - ', $val, "\n" if !$check;
    last if !$check;
}

# bad value: in index 547 - 133015568

say 'Time execution: ', now - INIT now;
