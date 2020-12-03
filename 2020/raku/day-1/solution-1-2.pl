
my @data = 'input-day-1.txt'.IO.lines.map: *.Int;
my $res;

MY-LABEL:
for @data -> $it1 {
    for @data -> $it2 {
        for @data -> $it3 {
            if $it1 + $it2 + $it3 == 2020 {
                $res = $it1 * $it2 * $it3;
                last MY-LABEL;
            }
        }
    }
}

say $res;

say 'Time execution: ', now - INIT now;

