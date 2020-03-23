%all
poziom([], _) :- write('+'), nl.
poziom([H|T], List) :-
    (member(H, List) -> write('+---'); write('+   ')),
    poziom(T, List).
pion([], _) :- nl.
pion([H|T], List) :-
    (member(H, List)-> write('|   '); write('    ')),
    pion(T, List).

wyswietl(List):-
    poziom([1,2,3], List),
    pion([4,5,6,7], List),
    poziom([8,9,10], List),
    pion([11,12,13,14], List),
    poziom([15,16,17], List),
    pion([18,19,20,21], List),
    poziom([22,23,24], List).

generuj(L):- numlist(1,24,L).

usun_nta(0,El,El).
%PN - previous n
usun_nta(N,[_|List1],List2):-
    N > 0, PN is N-1,
    usun_nta(PN,List1,List2).
usun_nta(N,[El|List1],[El|List2]):-
    N > 0, usun_nta(N,List1,List2).

%bez powtorzen
podzbior([],[]).
podzbior([X|T1], [X|T2]) :- podzbior(T1, T2).
podzbior(X, [_|T2]) :- podzbior(X, T2).

polacz(X, Set):-
    polacz(X,Y,[]),sort(Y,Set).

polacz([],Final,Final).
polacz([Head|Tail],S1,S2):-
    union(Head,S2,Result),polacz(Tail,S1,Result).

%1
duze(L) :-
    L = [[1,2,3,4,7,11,14,18,21,22,23,24]].
%4
srednie(L) :-
    L = [
        [1, 2, 4, 6, 11, 13, 15, 16],[2, 3, 5, 7, 12, 14, 16, 17],
        [8, 9, 11, 13, 18, 20, 22, 23],[9, 10, 12, 14, 19, 21, 23, 24]
    ].
%9
male(L) :-
    L = [
        [1,4,5,8],[2,5,6,9],[3,6,7,10],[8,11,12,15],[9,12,13,16],
        [10,13,14,17],[15,18,19,22],[16,19,20,23],[17,20,21,24]
    ].

sprawdz(0,[],_).
sprawdz(0,Kw,L):-
    member(K,Kw),
    \+ intersection(K,L,K).
% N_ nastepny, P_ poprzedni it
sprawdz(K,Kw,L):-
    K > 0,
    select(S,Kw,NK),
    intersection(S,L,S),
    PK is K-1,
    sprawdz(PK,NK,L).


zapalki(N,(D,S,M)):-
    generuj(Wszystkie),
    usun_nta(N,Wszystkie,List),
    duze(Duze_zap),
    srednie(Sr_zap),
    male(Male_zap),
    sprawdz(D,Duze_zap,List),
    sprawdz(S,Sr_zap,List),
    sprawdz(M,Male_zap,List),
    write(List),
    sort(List,Res),
    wyswietl(Res).
