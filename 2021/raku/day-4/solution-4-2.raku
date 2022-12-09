#!/usr/bin/env raku

#`(((

)))

#my $filename = 'input-day-4-test.txt';
my $filename = 'input-day-4.txt';

my @lines = $?FILE.IO.dirname.IO.add($filename).slurp.trim.lines;
my @items = @lines.map(*.comb.map(*.Int));

my $cond_oxy = -> $zero, $one { $one >= $zero ?? 1 !! 0 };
my $cond_co2 = -> $zero, $one { $zero <= $one ?? 0 !! 1 };

sub eachitems(@items1 is copy, &cond) {
    my $max = @items1[0].elems - 1;
    my $nelems = @items1.elems;
    my ($zero, $one) = 0, 0;
    for 0..$max -> $n2 {
        for 0..$nelems-1 -> $n1 {
            with @items1[$n1][$n2] {
                $one += $_ +& 1;
                $zero += $_ +^ 1;
            }
        }
        # if ($zero|$one > 0) {
        my $res = &cond($zero, $one);
        for @items1.kv -> $i, $v {
            if $v[$n2] != $res {
                @items1[$i] = Nil;
            }
        }
        @items1 = @items1.grep(*.so);
        # }
        $nelems = @items1.elems;
        $one = 0;
        $zero = 0;
        if $nelems == 1 {
            # say $n2, ' ', $max;
            return @items1;
        }
    }
    return @items1;
}

my $oxy = eachitems(@items, $cond_oxy)[0].join.parse-base(2);
my $co2 = eachitems(@items, $cond_co2)[0].join.parse-base(2);

say 'Answer: ', $oxy * $co2;
# Answer (test): 230
# Answer: 6940518

say 'Time execution: ', now - INIT now; # 0.0846453
