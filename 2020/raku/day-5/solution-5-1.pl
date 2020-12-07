
my @lines = 'input-day-5.txt'.IO.slurp.lines;

my $max = 0;
for @lines -> $line {
    my $n = :2($line.subst('B', 1, :g).subst('F', 0, :g).subst('R', 1, :g).subst('L', 0, :g)).Int;
    $max = $n if $n > $max;
}
$max.say; # 994

say 'Time execution: ', now - INIT now;
