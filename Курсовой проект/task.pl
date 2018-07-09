:- ['database.pl'].

secondcousin(X, Y):- % предикат к заданию номер 3 (Y - троюродный брат или сестра)
    parent(P, X),
    parent(PP, P),
    parent(PPP,PP),
    parent(PPP,SS),
    SS \= PP,
    sex(PPP, male),
    parent(SS, S),
    parent(S, Y).

/*
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
*/
