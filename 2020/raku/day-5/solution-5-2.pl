
my @lines = 'input-day-5.txt'.IO.slurp.lines;

my @alist;
my ($min, $max) = Nil, 0;
for @lines -> $line {
    my $n = :2($line.subst('B', 1, :g).subst('F', 0, :g).subst('R', 1, :g).subst('L', 0, :g)).Int;
    @alist.push: $n;
    $min = !$min ?? $n !! $min > $n ?? $n !! $min;
    $max = $n if $n > $max;
}

my $place = ($min ^..^ $max).grep({$_ !(elem) @alist}).first;
say $place; # 741

say 'Time execution: ', now - INIT now;
