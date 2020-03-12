arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).


osiagalny_last_element_check(X,Y,L):-
    arc(X,Y),
    \+ member(Y,L).

osiagalny_last_element_check(X,Y,L):-
    arc(X,Z),
    \+ member(Z,L),
    osiagalny_last_element_check(Z,Y,[X|L]),write([X,L]).

osiagalny(X,X):-
    true.

osiagalny(X,Y):-
    osiagalny_last_element_check(X,Y,[X]).
