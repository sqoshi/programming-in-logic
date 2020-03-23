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

%przechodniosc  :
%zamiana implikacji na alternatywe:
%
%    [ xRy i yRz => xRz  ]<=> [ not(xRy i yRz) lub xRz ],
%
%i dalej zaprzeczenie i zamiana alternatywy na koniunkcje z de Morgana
%
%    [ not(xRy i yRz) lub xRz ] <=> not[(xRy i yRz ) i not(xRz)]
%
%i teraz można pominąć nawiasy wewnątrz więc :
%not[xRy i yRz  i not(xRz)]
%
%    not(le(X,Y),le(Y,Z),not(le(X,Z))).
przechodnia() :-
    not((
    (le(X,Y)),
    (le(Y,Z)),
    not(le(X,Z))
    )).

%antysymetryczna:
%znowu,
%
%    [ xRy i yRx => x = y ] <=> [ not(xRy i yRx) lub x=y ]
%
%
%i de Morgana, bo nie chcę alternatywy
%
%    [ not(xRy i yRx) lub x=y ] <=> not[ (xRy i yRx) i not( x=y) ]
%
antysymetryczna() :-
    not((
        le(X,Y),
        le(Y,X),
        not(equal(X,Y))
    )).

%zwrotna() :-
%    not(
%        (not(le(X,_)),not(le(_,X)));
%        le(X,X)
%       ).
zwrotna() :-
    not( (le(X,Y),le(Y,X),Y \= X)).
