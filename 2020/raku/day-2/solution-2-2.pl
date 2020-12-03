
my @data = 'input-day-2.txt'.IO.lines;
my $res;
my $nfinds = 0;

for @data -> $line {
    my ($min, $max, $pattern, $str) = @(
            $line ~~ / (\d+) '-' (\d+) \s (\w) ':' \s (\w+) /
        ).map: *.Str;

    my @a-str = $str.comb;

    $min = $min - 1;
    $max = $max - 1;

    $nfinds++ if @a-str[$min] ne @a-str[$max]
        && (@a-str[$min] eq $pattern || @a-str[$max] eq $pattern);
}

say $nfinds;

say 'Time execution: ', now - INIT now;
