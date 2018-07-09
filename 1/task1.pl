% Шевчук Павел Вячеславович
% -------------------------------------------------- 

% Длина
length_([],0).
length_([_|Tail],N):-length_(Tail,N1), N is N1+1.

% Принадлежность
member_my(X,[X|_]).
member_my(X,[_|Y]) :- member_my(X,Y).    

% Конкатенация
append_my(X, [], X).
append_my([], X, X).
append_my([A|X], Y, [A|Z]) :- append_my(X, Y, Z).

% Удаление (элемент, список, результат).
remove_my(X, [X|T], T).
remove_my(X, [Y|T], [Y|T1]) :- remove_my(X, T, T1).

% Перестановки
permute_my([],[]).
permute_my( L, [X|R]) :- remove_my(X, L, T), permute_my(T, R). 

% Подсписок
sublist_my(S, L) :- append_my(_, Y, L), append_my(S, _, Y), !.


% Вариант 3: Удаление 3-ёх последних эл-тов списка(ввести вместо N - 3) 
del(L,N,[]):-length_(L,N).
del([H|Tail],N,[H|NTail]):-del(Tail,N,NTail).


%------ Числовые списки


% Вариант7 : Проверка упорядоченности элементов по возрастанию
check_order([_]).
check_order([X,Y|T]):-X<Y,!,check_order([Y|T]).
