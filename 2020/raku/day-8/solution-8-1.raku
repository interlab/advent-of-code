#!/usr/bin/env raku

my @items = $?FILE.IO.dirname.IO.add('input-day-8.txt').IO.slurp.trim.lines;
# my @items = $?FILE.IO.dirname.IO.add('input-day-8-test.txt').IO.slurp.trim.lines;

@items = @items.map({
    / ^ $<op>=['nop' || 'acc' || 'jmp'] \s+ $<val>=[['+' || '-']\d+] $ /;
    { oper => $<op>.Str, val => $<val>.Int }
});

my Int $accumulator = 0;
my Int $pos = 0;
my Int @run-indexes;
my Int $count-items = @items.elems;

sub complete-program(@vals) {
    $accumulator = 0;
    $pos = 0;
    @run-indexes = ();
    loop {
        last if $pos >= $count-items;
        return False if $pos (elem) @run-indexes;
        @run-indexes.push($pos) if $pos !(elem) @run-indexes;
        my %item = @vals[$pos];
        given %item<oper> {
            when 'nop' { $pos += 1; }
            when 'acc' {
                $accumulator += %item<val>;
                $pos += 1;
            }
            when 'jmp' {
                $pos += %item<val>;
            }
        }
    }
    True;
}

complete-program(@items);

say 'bad index: ', $pos; # 372 # 1 on test data
say 'accumulator: ', $accumulator; # 1134 # 5 on test data

say 'Time execution: ', now - INIT now;
