wielokrotnie(X,L):-
    select(X,L,R),
    member(X,R).

jednokrotnie(X,L) :-
    select(X,L,R),
    not(member(X,R)).

dwukrotnie(X,L) :-
    select(X,L,R),
    member(X,R),
    jednokrotnie(X,R).

