#!/usr/bin/env raku

#`(((

)))

#my $filename = 'input-day-4-test.txt';
my $filename = 'input-day-4.txt';

my @items = $?FILE.IO.dirname.IO.add($filename).slurp.trim.lines.map(*.comb.map(*.Int));
#say @items;

my $nlines = @items.elems - 1;
my $max = @items[0].elems - 1;
my ($zero, $one) = 0, 0;
my (@gamma, @epsilon, $g, $e);

for 0..$max -> $n2 {
    for 0..$nlines -> $n1 {
        with @items[$n1][$n2] {
            $zero += $_ +& 1;
            $one += $_ +^ 1;
        }
    }
    @gamma[$n2] = $zero > $one ?? 0 !! 1;
    @epsilon[$n2] = @gamma[$n2] +^ 1;
    $one = 0;
    $zero = 0;
}

$g = @gamma.join('').parse-base(2);
$e = @epsilon.join('').parse-base(2);

say 'Answer: ', $g * $e; # Answer (test): 198
                         # Answer: 3009600

say 'Time execution: ', now - INIT now; # 0.1158995
