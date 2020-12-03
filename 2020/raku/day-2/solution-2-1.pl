
my @data = 'input-day-2.txt'.IO.lines;
my $res;
my $nfinds = 0;

for @data -> $line {
    my ($min, $max, $pattern, $str) = @(
            $line ~~ / (\d+) '-' (\d+) \s (\w) ':' \s (\w+) /
        ).map: *.Str;

    my $sum = $str.comb($pattern).elems;

    $nfinds++ if $min.Int <= $sum <= $max.Int;
}

say $nfinds;

say 'Time execution: ', now - INIT now;
