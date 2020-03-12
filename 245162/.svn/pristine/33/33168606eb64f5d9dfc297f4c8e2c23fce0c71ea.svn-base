even_permutation([],[]).
even_permutation([X|L], P):-
    even_permutation(L,P1),
    insert_odd(X,P1,P).
even_permutation([X|L],P):-
    odd_permutation(L,P1),
    insert_even(X,P1,P).

odd_permutation([X|L],P):-
    odd_permutation(L,P1),
    insert_odd(X,P1,P).
odd_permutation([X|L],P):-
    even_permutation(L,P1),
    insert_even(X,P1,P).


insert_odd(X1,L,[X1|L]).
insert_odd(X1,[X2,X3|L],[X2,X3|InsertedList]):-
    insert_odd(X1,L,InsertedList).
insert_even(X1,[X2|L],[X2,X1|L]).
insert_even(X1,[X2,X3|L],[X2,X3|InsertedList]):-
    insert_even(X1,L,InsertedList).

