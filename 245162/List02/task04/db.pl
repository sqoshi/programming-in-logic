% 0+X = X
regula(X,+,Y,Y):-
    number(X),
    X=:=0,!.
% 0*X = 0
regula(X,*,Y,X):-
    number(X),
    X=:=0,!.

uprosc(X+Y, X1+Y1) :- uprosc(X, X1), uprosc(Y, Y1).
uprosc(X*Y, X1*Y1) :- uprosc(X, X1), uprosc(Y, Y1).
uprosc(X/Y, X1/Y1) :- uprosc(X, X1), uprosc(Y, Y1).
uprosc(X-Y, X1-Y1) :- uprosc(X, X1), uprosc(Y, Y1).

uprosc(X*Y,0).
uprosc(0*X,0).

