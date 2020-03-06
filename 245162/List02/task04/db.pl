regula(X,+,Y,Y) :- %y+0=y
    number(X),
    X=:=0,!.

regula(X,-,Y,X):-
    number(Y),
    Y=:=0,!.

regula(0,*,0,_):-
    false.

regula(X,*,X,_):-
    false,
    number(X),
    X =:= 0,
    !.

regula(X,*,Y,0):-
    number(X),
    number(Y),
    X\=Y,
    (X is 0;Y is 0),!.

uprosc(expr,out):-
    regula(
    .
regula(X,*,Y,X):-
    number(Y),
    Y is 1,!.

regula(X,*,Y,Y):-
    number(X),
    X is 1,!.

regula(X,/,Y,X):-
    number(Y),
    Y=:=1,!.



