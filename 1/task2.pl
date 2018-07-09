% Task 2: Relational Data
 %Вариант 2
 %   - Напечатать средний балл для каждого предмета
 %   - Для каждой группы, найти количество не сдавших студентов 
 %   - Найти количество не сдавших студентов для каждого из предметов
% The line below imports the data
:- ['four.pl'].
:- ['task1.pl'].
% Предикат отрицания(negation as failure)
not(X):- \+ X.
%предикат суммы
sum([],0).
sum([X|T],R):-
	sum(T,R1), R is R1+X.
%предикат среднего значения
average(T,R):-
	sum(T,N), length(T,X), R is N/X. 

% task2.1)Напечатать средний балл для каждого предмета

% Сумма оценок по предмету
% (список оценок, сумма оценок)
sum_marks([],0).
sum_marks([grade(X,Y)|T],N):- sum_marks(T,M), N is Y + M.

% Средний балл для предмета
% (название предмета, средняя оценка)
average_mark(Sub,Mark):-
    subject(Sub,Y),
    sum_marks(Y, Sum),
    length(Y, Len),
    Mark is Sum / Len.

% task2.2 Для каждой группы, найти количество не сдавших студентов

% Список всех оценок по всем предметам
% (список предметов, список оценок)
all_marks([],L).
all_marks([H|T], List_pass):-subject(H,X), all_marks(T, New_list), append(X, New_list, List_pass).

% Удаление повторяющихся оценок
delete_all(_,[],[]).
delete_all(X,[X|L],L1):-delete_all(X,L,L1).
delete_all(X,[Y|L],[Y|L1]):- X \= Y, delete_all(X,L,L1).

remove_same([],[]).
remove_same([H|T],[H|T1]):-delete_all(H,T,T2), remove_same(T2,T1).

% Проверяем, сколько студентов, получивших 2, имеются в нужной группе
% (список всех оценок, список группы, количество несдавших студентов из группы)
check([],L,0).
check([grade(X,Y)|T],L,N):- Y < 3, my_member(X, L), !, check(T,L,M), N is M + 1.
check([_|T],L,N):-check(T,L,N).

% Количество несдавших студентов в группе
% (номер группы, число несдавших)
do_not_pass_group(Gr,Count):-
    group(Gr, Lgroup),
    findall(Sub, subject(Sub,_), Subs),
    all_marks(Subs, List_pass),
    remove_same(List_pass, New),
    check(New, Lgroup, Count).

% task2.3 nНайти количество несдавших студентов для каждого из предметов

%(список оценок, число несдавших)
count_do_not_pass([],0).
count_do_not_pass([grade(X,Y)|T],N):- Y < 3, !, count_do_not_pass(T,M), N is M + 1.
count_do_not_pass([_|T],N):-count_do_not_pass(T,N).

% (название предмета, число студентов)
do_not_pass_sub(Sub,Count):-
    subject(Sub,Y),
    count_do_not_pass(Y,Count).
