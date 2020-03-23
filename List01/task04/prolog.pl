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
    \+ (le(Y,X),X\=Y).

%poprawione, najwiekszy to max, ale jednoczesnie nie ma innego maksa
biggest(X) :-
    max(X),
    \+ (max(Y),(le(_,Y),Y\=X)).

% analogicznie do biggest
smallest(X) :-
    min(X),
    \+ (min(Y), (le(Y,_),Y\=X)).









