#!/usr/bin/env raku

#`(((
Теперь вам нужно выяснить, как пилотировать эту штуку.

Кажется, что подводная лодка может выполнять ряд команд, например, вперед 1, вниз 2 или вверх 3:
     вперед X увеличивает горизонтальное положение на X единиц.
     вниз X увеличивает глубину на X единиц.
     вверх X уменьшает глубину на X единиц.

Обратите внимание, что, поскольку вы находитесь на подводной лодке, спуск и подъем влияют на вашу глубину,
поэтому они имеют противоположный результат, чем вы могли бы ожидать.

Подводная лодка, кажется, уже имеет запланированный курс (ввод вашей головоломки).
Вам, вероятно, следует выяснить, куда он идет. Например:

forward 5
down 5
forward 8
up 3
down 8
forward 2

И ваше горизонтальное положение, и глубина начинаются с 0.
После этого шаги, указанные выше, изменят их следующим образом:

     Вперед 5 добавляет 5 к вашему горизонтальному положению, итого 5.
     вниз 5 добавляет 5 к вашей глубине, в результате получается значение 5.
     вперед 8 добавляет 8 к вашему горизонтальному положению, всего 13.
     up 3 уменьшает вашу глубину на 3, в результате получается значение 2.
     вниз 8 добавляет 8 к вашей глубине, в результате получается значение 10.
     Вперед 2 добавляет 2 к вашему горизонтальному положению, всего 15.

После выполнения этих инструкций у вас будет горизонтальное положение 15 и глубина 10. (Умножение их вместе дает 150.)

Рассчитайте горизонтальное положение и глубину, которые будут у вас после прохождения запланированного курса.
Что вы получите, если умножите свое окончательное горизонтальное положение на конечную глубину?
)))

# my $filename = 'input-day-2-test.txt';
my $filename = 'input-day-2.txt';

my @items = $?FILE.IO.dirname.IO.add($filename).slurp.trim.lines;
#say @items;

my ($x, $y) = 0, 0;

for @items {
    my ($it, $num) = $_.split(' ');
    $num .= Int;

    given $it {
        when 'forward' { $x += $num; }
        when 'down' { $y += $num; }
        when 'up' { $y -= $num; }
    }
}

#say 'x:', $x;
#say 'y:', $y;

say 'Answer: ', $x * $y; # Answer (test): 150
                         # Answer: 1451208

say 'Time execution: ', now - INIT now;
