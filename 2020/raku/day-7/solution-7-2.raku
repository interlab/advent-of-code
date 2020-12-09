#!/usr/bin/env raku

my @items = $?FILE.IO.dirname.IO.add('input-day-7.txt').slurp.trim.split("\n");

my %rules;
for @items {
    my $item = $_;
    my ($key, $val) = $item.split(/' bags contain '/);
    $val = $val.split(/' bags, ' || ' bag, '/).map({$_.subst(/ ' bag' 's'? '.' $/, '', :g)});

    %rules{$key} = $val
            .map({
                $_ ~~ / ^ (\d+) ' ' (.*?) $ /;
                $/ ?? { $1.Str => $0.Int } !! {}
            }).Hash;
}

sub count-bags($key='shiny gold')
{
    my $sum = 0;
    for %rules{$key}.kv -> $k, $v {
        $sum += $v + $v * count-bags($k);
    }
    $sum;
}

say count-bags(); # 176035

say 'Time execution: ', now - INIT now; # 0.252341
