
my @data = 'input-day-3.txt'.IO.lines;

sub each-trees(@lines, $right, $down --> Int)
{
    my @data = @lines.map: *.comb;
    my $right-ind = 0;
    my $down-ind = 0;
    my $ntrees = 0;
    my $len = @data[0].elems;

    for @data -> $line {
        $right-ind = ($right-ind + $right) % $len;
        $down-ind = $down-ind + $down;
        last if $down-ind > @data.elems - 1;
        $ntrees++ if @data[$down-ind][$right-ind] eq '#';
    }

    return $ntrees;
}

my @params = (1, 1),(3, 1),(5, 1),(7, 1),(1, 2);

say [*] @params.map({ each-trees(@data, $_[0], $_[1]) });

say 'Time execution: ', now - INIT now;
