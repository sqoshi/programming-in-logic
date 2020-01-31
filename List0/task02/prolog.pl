on(b,a).
on(c,b).
on(d,b).
on(e,d).

above(X, Y) :-
     on(Y,X).

above(X, Y) :-
    above(X,Z),
    above(Z,Y),
    \+ (on(X,Y)).

