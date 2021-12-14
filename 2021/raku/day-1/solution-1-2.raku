#!/usr/bin/env raku

#`(
--- Часть вторая ---

Рассмотрение каждого отдельного измерения не так полезно, как вы ожидали: в данных слишком много шума.
Вместо этого рассмотрим суммы скользящего окна с тремя измерениями. Снова рассматривая приведенный выше пример:

199  A
200  A B
208  A B C
210    B C D
200  E   C D
207  E F   D
240  E F G
269    F G H
260      G H
263        H

Начните с сравнения первого и второго окон с тремя измерениями.
Измерения в первом окне помечены как (199, 200, 208); их сумма равна 199 + 200 + 208 = 607.
Второе окно помечено как B (200, 208, 210); его сумма равна 618.
Сумма измерений во втором окне больше, чем сумма первого, поэтому это первое сравнение увеличилось.

Теперь ваша цель - подсчитать, во сколько раз сумма измерений в этом скользящем окне увеличивается
по сравнению с предыдущей суммой. Итак, сравните A с B, затем сравните B с C, затем C с D и так далее.
Остановитесь, когда останется недостаточно измерений для создания новой суммы из трех измерений.

В приведенном выше примере сумма каждого окна из трех измерений выглядит следующим образом:

A: 607 (N/A - нет предыдущей суммы)
B: 618 (увеличено)
C: 618 (без изменений)
D: 617 (уменьшено)
E: 647 (увеличено)
F: 716 (увеличенный)
G: 769 (увеличено)
Высота: 792 (увеличено)

В этом примере есть 5 сумм, которые больше предыдущей суммы.

Рассмотрим суммы скользящего окна с тремя измерениями. На сколько сумм больше предыдущей суммы?
)

# my $filename = 'input-day-1-test.txt';
my $filename = 'input-day-1.txt';

my @items = $?FILE.IO.dirname.IO.add($filename).slurp.trim.lines;
# say @items;

my $res = @items.rotor(3 => -2).map({ $_.sum }).rotor(2 => -1).map({ $_[0] < $_[1] })>>.Int.sum;

say 'Answer: ', $res; # Answer: 5 (test)
                      # Answer: 1653

say 'Time execution: ', now - INIT now;
