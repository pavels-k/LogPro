# Отчет по курсовому проекту
## по курсу "Логическое программирование"

### Cтудент: Шевчук П.В.

## Введение

Я научусь использовать предикаты, построенные на основе дерева родственников. С помощью предикатов можно будет определять различные связи между родственниками. Также я буду сопоставлять последовательности слов или символов — так называемой формальной грамматике на высокоуровневом языке программирования Python

## Задание

 1. Создать родословное дерево своего рода на несколько поколений (3-4) назад в стандартном формате GEDCOM с использованием сервиса MyHeritage.com.
 2. Преобразовать файл в формате GEDCOM в набор утверждений на языке Prolog, используя следующее представление: parent(родитель, ребенок), sex(человек, m/f)
 3. Реализовать предикат проверки/поиска родственника: троюродный брат или сестра. 
 4. Реализовать программу на языке Prolog, которая позволит определять степень родства двух произвольных индивидуумов в дереве
 
## Получение родословного дерева

Для получения родословного дерева, я зарегистрировался на сайте https://www.myheritage.com. Скачал программу для Windows и начал вносить в родословное дерево своих родственников. Общее число людей равно 82.

## Конвертация родословного дерева

Для парсинга файла формата GEDCOM я использую язык python. В цикле я пробегаю все строки файла. Запоминаю в словарь всех родственников, вместе с их ID. Данные помещаются в файл формата pl, использованный для записи.
``` Python
for input_string in input_file:
    if input_string == "\n":
        continue
    elif input_string.find("NAME", 0, len(input_string)) > -1:
        i = input_string.index("/", 0, len(input_string))
        name = input_string[7:i - 1] 
```

## Предикат поиска родственника

Предикат 'secondcousin' проверяет, являются ли родственники троюродными братьями или сёстрами. Находим общего прадеда PPP. 'SS\\=PP' используется, чтобы человек сам себе не являлся родственником. Указываем пол, прадеда 'sex(PPP, male)'(неважно какой), чтобы программа не повторялась.
``` Prolog
secondcousin(X, Y):- % предикат к заданию номер 3 (Y - троюродный брат или сестра)
    parent(P, X),
    parent(PP, P),
    parent(PPP,PP),
    parent(PPP,SS),
    SS \= PP,
    sex(PPP, male),
    parent(SS, S),
    parent(S, Y).
 ```
Тесты: 
``` prolog
?- secondcousin(pavel_shevchuk, dimon_shevchuk).
true
?- secondcousin(alexey_bobrov,pavel_shevchuk).
false.
?- secondcousin(pavel_shevchuk, X).
X = dimon_shevchuk ;
X = yulia_verova ;
?- secondcousin(X,Y).
X = pavel_shevchuk,
Y = dimon_shevchuk ;
X = pavel_shevchuk,
Y = yulia_verova ;
X = mariya_shevchuk,
Y = dimon_shevchuk ;
X = mariya_shevchuk,
Y = yulia_verova ;
X = yuiri_kuzmin,
Y = dimon_shevchuk ;
X = yuiri_kuzmin,
Y = yulia_verova ;
X = maria_bobrova,
Y = dimon_shevchuk ;
X = maria_bobrova,
Y = yulia_verova ;
X = dimon_shevchuk,
Y = pavel_shevchuk ;
X = dimon_shevchuk,
Y = mariya_shevchuk ;
X = dimon_shevchuk,
Y = yuiri_kuzmin ;
X = dimon_shevchuk,
Y = maria_bobrova ;
X = yulia_verova,
Y = pavel_shevchuk ;
X = yulia_verova,
Y = mariya_shevchuk ;
X = yulia_verova,
Y = yuiri_kuzmin ;
X = yulia_verova,
Y = maria_bobrova ;
```


## Выводы

В hезультате выполнения курсового проекта, я закрепил свои навыки по языку логического программирования prolog. Увидел большое преимущество его работы с большим обьёмом данных. Данная курсовая работа познакомила меня с языком программирования python. Я понял, что этот язык очень простой (особенно для работы со строками) и полезный. В дальнейшем, я планирую изучить этот язык глубже и основательнее.
