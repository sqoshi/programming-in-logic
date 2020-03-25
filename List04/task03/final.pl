%zbiory kwadratow wedlug rozmiaru
big_squares(
    [1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24]).
mid_squares(
    [[1, 2, 4, 6, 11, 13, 15, 16], [2, 3, 5, 7, 12, 14, 16, 17],
     [8, 9, 11, 13, 18, 20, 22, 23], [9, 10, 12, 14, 19, 21, 23, 24]]).
small_squares(
    [[1, 4, 5, 8], [2, 5, 6, 9], [3, 6, 7, 10],
     [8, 11, 12, 15],[9, 12, 13, 16], [10, 13, 14, 17],
     [15, 18,19, 22], [16, 19, 20, 23], [17, 20, 21, 24]]).

%podzbiory
subset([],[]).
subset([H|T1], [H|T2]):-
    subset(T1,T2).
subset(L,[_|T]):-
    subset(L,T).

% summator
my_union(S,[El]):-
    S=El.
my_union(S,[H|T]):-
    my_union(NS,T),
    union(H,NS,S).

%generowanie
create_big_squares(B,0):-
    B = [].
create_big_squares(B,1):-
    big_squares(B).
create_mid_squares(M,0):-
    M = [].
create_mid_squares(M,N):-
    mid_squares(SS),
    subset(Set,SS), %set-list,subset
    length(Set,N),
    my_union(M,Set).
create_small_squares(S,0):-
    S = [].
create_small_squares(S,N):-
    small_squares(SS),
    subset(Set,SS),
    length(Set,N),
    my_union(S,Set).

%checkers
check(_,[],N,N).
check(L,[H|T],Counter,N):-
    subset(H,L),
    InC is Counter + 1,
    check(L,T,InC,N).
check(L,[H|T],Counter,N):-
    \+ subset(H,L),
    check(L,T,Counter,N).
check_big_squares(L,1):-
    big_squares(B),
    subset(B,L).
check_big_squares(L,0):-
    big_squares(B),
    \+ subset(B,L).
check_mid_squares(L,N):-
    mid_squares(M),
    check(L,M,0,N).
check_small_squares(L,N):-
    small_squares(S),
    check(L,S,0,N).

%printers
draw_matches(L) :-
    horizontal([1,2,3], L),
    vertical([4,5,6,7], L),
    horizontal([8,9,10], L),
    vertical([11,12,13,14], L),
    horizontal([15,16,17], L),
    vertical([18,19,20,21], L),
    horizontal([22,23,24], L).
horizontal([], _) :- write('+'), nl.
horizontal([N|T], L) :-
    (member(N, L)-> write('+---'); write('+   ')),
    horizontal(T, L).
vertical([], _) :- nl.
vertical([N|T], L) :-
    (member(N, L)-> write('|   '); write('    ')),
    vertical(T, L).

zapalki(Z,(duze(N1),srednie(N2))):- zapalki(Z,(duze(N1),srednie(N2),male(0))).
zapalki(Z,(duze(N1),male(N2))):- zapalki(Z,(duze(N1),srednie(0),male(N2))).
zapalki(Z,(srednie(N1),male(N2))):- zapalki(Z,(duze(0),srednie(N1),male(N2))).
zapalki(Z,(duze(N1),srednie(N2),male(N3))):-
    create_big_squares(B,N1),
    create_mid_squares(M,N2),
    create_small_squares(S,N3),
    my_union(L,[B,M,S]), sort(L,LS),
    check_big_squares(LS,N1),
    check_mid_squares(LS,N2),
    check_small_squares(LS,N3),
    between(0,24,Z),
    Len is 24-Z,
    length(L,Len),
    draw_matches(L).


