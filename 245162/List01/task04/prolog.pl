le(0,1).
le(1,2).
le(2,3).
le(3,4).
le(4,5).
le(5,5).
le(1,1).

le_rec(X,X) :-
    true.

le_rec(X,Y) :-
    le(X,Y).

le_rec(X,Y) :-
    le(X,Z),
    le_rec(Z,Y).

max(X) :-
    \+ (le(X,Y),Y\=X).

min(X) :-
    \+ (le(Y,X),Y\=X).

biggest(X) :-
    max(X),
    \+(le(X,X)).

smallest(X) :-
    min(X),
    \+ (le(X,X)).