#!/usr/bin/env raku

# my @items = $?FILE.IO.dirname.IO.add('input-day-10-test-1.txt').IO.slurp.trim.lines.map({ $_.Int }).sort;
# my @items = $?FILE.IO.dirname.IO.add('input-day-10-test-2.txt').IO.slurp.trim.lines.map({ $_.Int }).sort;
my @items = $?FILE.IO.dirname.IO.add('input-day-10.txt').slurp.trim.lines.map({ $_.Int }).sort;
die('value < 1') if 0 > @items.any;

sub count-ways() {
    my %ways = (0 => 1);

    for @items -> $val {
        %ways{$val} = (1,2,3)
            .grep({ %ways{$val - $_}:exists })
            .map({ %ways{$val - $_} // 0 })
            .sum();
    }

    %ways{@items.tail};
}

say 'Answer: ', count-ways(); # 42313823813632

say 'Time execution: ', now - INIT now;
