
my @data = 'input-day-3.txt'.IO.lines;

my $ind = 0;
my $ntrees = 0;
my $line-len = @data[0].comb.elems;

for @data -> $line {
    FIRST {
        $ind = ($ind + 3) % $line-len;
        next;
    }
    my @line = $line.comb;
    $ntrees++ if @line[$ind] eq '#';
    $ind = ($ind + 3) % $line-len;
}

say $ntrees;

say 'Time execution: ', now - INIT now;
