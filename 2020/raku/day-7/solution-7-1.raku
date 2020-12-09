#!/usr/bin/env raku

my @items = 'input-day-7.txt'.IO.slurp.trim.split("\n");

my %childs;

for @items {
    my ($key, $val) = $_.split(/' bags contain '/);
    $val = $val.split(/' bags, ' || ' bag, '/).map({$_.subst(/ ' bag' 's'? '.' $/, '', :g)});

    my %vals = $val.map({
        $_ ~~ / ^ (\d+) ' ' (.*?) $ /;
        $/ ?? { $1.Str => $0.Int } !! {}
    }).Hash;

    for %vals.kv -> $k, $v {
        %childs{$k}{$key} = 1;
    }
}

my @queue = %childs{'shiny gold'}.keys;
my @count-bags;

while @queue.elems > 0 {
    my $bag = @queue.shift;
    @count-bags.push($bag) if $bag !(elem) @count-bags;
    if %childs{$bag} {
        my @new-bags = %childs{$bag}.keys.grep({ $_ !(elem) @count-bags });
        if @new-bags {
            @queue.push(|@new-bags);
        }
    }
}

say @count-bags.elems; # 242

say 'Time execution: ', now - INIT now;
