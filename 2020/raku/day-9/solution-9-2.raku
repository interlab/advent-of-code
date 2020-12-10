#!/usr/bin/env raku

my @items = $?FILE.IO.dirname.IO.add('input-day-9.txt').IO.slurp.trim.lines;
#my @items = $?FILE.IO.dirname.IO.add('input-day-9-test.txt').IO.slurp.trim.lines.map: *.Int;
@items =  @items.map: *.Int;

#my Int $preambula = 5; # for test data
my Int $preambula = 25;

my Int @numbers = @items[$preambula..*-1];

sub get-variants(@nums) {
    my Int @variants;
    for @nums -> $v1 {
        for @nums -> $v2 {
            next if $v1 == $v2;
            @variants.push($v1 + $v2) if ($v1 + $v2) !(elem) @variants;
        }
    }
    @variants;
}

my $bad-ind;
my $bad-num;

for @numbers.kv -> $ind, $val {
    my $check = $val (elem) get-variants(@items[$ind..^($ind + $preambula)]);
    if !$check {
        say 'in index: ', $ind, ' - bad value: ', $val;
        $bad-ind = $ind;
        $bad-num = $val;
        last;
    }
}

LABEL:
for 0..$bad-ind - 2 {
    my $start-ind = $_;
    my $end-ind = $start-ind + 1;
    loop {
        if $end-ind > $bad-ind - 1 {
            die('Error: ' ~ $?LINE);
        }
        my $sum = @items[$start-ind..$end-ind].sum;
        if $sum < $bad-num {
            $end-ind += 1;
            next;
        }
        if $sum > $bad-num {
            $start-ind += 1;
            $end-ind = $start-ind + 1;
            last;
        }
        if $sum == $bad-num {
            my ($min, $max) = @items[$start-ind..$end-ind].sort()[0,*-1];
            say 'Answer: ', $min + $max, "\n";
            last LABEL;
        };
    }
}

# Answer: 16107959

say 'Time execution: ', now - INIT now;
