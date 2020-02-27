le(1,1).
le(1,2).
le(1,3).
le(1,4).

le(2,2).
le(2,3).
le(2,4).

le(3,3).
le(3,4).

le(4,4).


czesciowy_porzadek :- przechodnia(), antysymetryczna(), zwrotna().

equal(X,Y) :-
    X is Y.

przechodnia() :-
    not((
    (le(X,Y)),
    (le(Y,Z)),
    not(le(X,Z))
    )).

antysymetryczna() :-
    not((
        le(X,Y),
        le(Y,X),
        not(equal(X,Y))
    )).

zwrotna() :-
    not(
        (not(le(X,_)),not(le(_,X)));
        le(X,X)
       ).