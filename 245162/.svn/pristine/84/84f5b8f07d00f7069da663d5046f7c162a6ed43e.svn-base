jednokrotnie(X,L) :-
    select(X,L,R),
    not(member(X,R)).

dwukrotnie(X,L) :-
    select(X,L,R),
    member(X,R),
    jednokrotnie(X,R).

sprawdzDwukrotnoscKazdego(N,L):-
    N>0,
    dwukrotnie(N,L),!.

sprawdzDwukrotnoscKazdego(N,L):-
    D is N-1,
    sprawdzDwukrotnoscKazdego(D,L).

add(x,l,l).
add(X,List,[X|List]).

indexOf([Element|_], Element, 0). % We found the element
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1), %Check in the tail of the list
  Index is Index1+1.  % and increment the resulting index



lista(N,L):-
    number(N),
    S is 2*N,
    length(L,S),
    sprawdzDwukrotnoscKazdego(N,L).
