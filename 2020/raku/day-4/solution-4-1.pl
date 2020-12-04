
my $contents = 'input-day-4.txt'.IO.slurp;

my @valid-fields = <byr iyr eyr hgt hcl ecl pid>;

my @passports = $contents.split(/ \n\n /);
my $npassports = 0;

for @passports -> $val {
    my %passport = $val.split(/ ' ' || \n /)
        .map({$_.split(':')}).map({$_[0] => $_[1]});

    if %passport<cid>:exists {
        %passport<cid>:delete;
    }

    if %passport.keys.elems > 6
        && %passport.keys.any eq @valid-fields.all {
        $npassports++;
    }
}

say $npassports; # 250

say 'Time execution: ', now - INIT now;
