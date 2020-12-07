
my @passports = 'input-day-4.txt'.IO.slurp.split(/ \n\n /);
my @valid-fields = <byr iyr eyr hgt hcl ecl pid>;
my $npassports = 0;

sub valid-fields(%val --> Bool)
{
    sub check-hgt($s --> Bool) {
        my ($num, $val) = $s.comb: $s.chars - 2;
        so $val eq 'cm' && 149 < $num.Int < 194
           || $val eq 'in' && 58 < $num.Int < 77;
    }

    so  1919 < %val<byr> < 2003
        && 2009 < %val<iyr> < 2021
        && 2019 < %val<eyr> < 2031
        && check-hgt(%val<hgt>)
        && %val<hcl> ~~ / ^ '#' <[0..9a..f]> ** 6 $ /
        && %val<ecl> (elem) <amb blu brn gry grn hzl oth>
        && %val<pid> ~~ / ^ <[0..9]> ** 9 $ /;
}

for @passports -> $val {
    my %passport = $val.split(/ ' ' || \n /)
        .map({$_.split(':')}).map({$_[0] => $_[1]});

    if %passport<cid>:exists {
        %passport<cid>:delete;
    }

    if %passport.keys.elems > 6
        && %passport.keys.any eq @valid-fields.all
        && valid-fields(%passport) {
        $npassports++;
    }
}

say $npassports; # 158

say 'Time execution: ', now - INIT now;
