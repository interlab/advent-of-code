#!/usr/bin/env raku

#my $filename = 'input-day-3-test.txt';
my $filename = 'input-day-3.txt';

my @items = $?FILE.IO.dirname.IO.add($filename).slurp.trim.lines.map(*.parse-base(2));
#say @items;

my $cond_oxy = -> $zero, $one { $one >= $zero ?? 1 !! 0 };
my $cond_co2 = -> $zero, $one { $zero <= $one ?? 0 !! 1 };

sub parse-items(@items1 is copy, &cond) {
    my $nlen = @items1.max.base(2).comb.elems;
    my @goods-vals;
    my ($zero, $one, $nelems);
    # проход по вертикали
    for ^$nlen -> $n2 {
        ($zero, $one, $nelems) = (0, 0, 0);
        # проход по горизонтали
        for ^Inf Z @items1 -> ($n1, $it) {
            my $v = ($it +> ($nlen - (1 + $n2))) +& 1;
            # подсчет нулей и единиц
            $zero += $v +^ 1;
            $one += $v;
        }
        my $res = &cond($zero, $one);
        for @items1.kv -> $i, $it {
            my $v = ($it +> ($nlen - (1 + $n2))) +& 1;
            if $v == $res {
                @goods-vals.push: $it;
                $nelems += 1;
            }
        }
        @items1 = @goods-vals;
        @goods-vals = ();
        if $nelems == 1 {
            last;
        }
    }

    return @items1[0];
}

my $oxy = parse-items(@items, $cond_oxy);
my $co2 = parse-items(@items, $cond_co2);

say 'Answer: ', $oxy * $co2;
# Answer (test): 230
# Answer: 6940518

say 'Time execution: ', now - INIT now; # 0.1079992
