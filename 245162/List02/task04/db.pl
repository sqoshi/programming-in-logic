%0+Y=Y
regula(X,+,Y,Y) :- %y+0=y
    number(X),
    X=:=0,!.
%X+0=X
regula(X,+,Y,X):-
    number(Y),
    Y=:=0,!.

%X-0=X
regula(X,-,Y,X):-
    number(Y),
    Y=:=0,!.

%0-Y=-Y
regula(X,-,Y,Y):-
    number(X),
    X=:=0.

%0*0 = error - false
regula(0,*,0,_):-
    false.
% X*0 = 0 i 0*Y =0
regula(X,*,Y,0):-
    number(X),
    number(Y),
    X\=Y,
    (X is 0;Y is 0),!.

%X * 1 = X
regula(X,*,Y,X):-
    number(Y),
    Y is 1,!.

%1 * Y = Y
regula(X,*,Y,Y):-
    number(X),
    X is 1,!.

% X/1 = X
regula(X,/,Y,X):-
    number(Y),
    Y=:=1,!.

% X / 0 - zawsze false!
regula(_,/,0,_):-
    false,!.



