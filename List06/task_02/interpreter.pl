interpreter([], _).
interpreter([read(ID)|T], Asoc) :- !,
    read(N),integer(N),set(Asoc, ID, N, Asoc1),interpreter(T, Asoc1).
interpreter([write(W)|T], Asoc) :- !,
    value(W, Asoc, X),write(X), nl,interpreter(T, Asoc).
interpreter([assign(ID, W)|T], Asoc) :- !,
    value(W, Asoc, Val),set(Asoc, ID, Val, Asoc1),interpreter(T, Asoc1).
interpreter([if(C, P)|T], AsocO) :- !,
    interpreter([if(C, P, [])|T], AsocO).
interpreter([if(C, P1, P2)|T], Asoc) :- !,
    (validate(C, Asoc) -> append(P1, T, Continue);append(P2, T, Continue)),
    interpreter(Continue, Asoc).
interpreter([while(C, P)|T], Asoc) :- !,
    append(P, [while(C, P)], Continue),interpreter([if(C, Continue) | T], Asoc).

interpreter(PROGRAM) :- interpreter(PROGRAM, []).

set([], ID, N, [ID=N]).
set([ID=_|Asoc], ID, N, [ID=N|Asoc]) :- !.
set([ID1=V1|Asoc1], ID, N, [ID1=V1|Asoc2]) :-
    set(Asoc1, ID, N, Asoc2).

load([ID=N|_], ID, N) :- !.
load([_|Asoc], ID, N) :- load(Asoc, ID, N).

value(int(N), _, N).
value(id(ID), Asoc, N) :- load(Asoc, ID, N).
value(V1 + V0, Asoc, N) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N is N1 + N2.
value(V1 - V0, Asoc, N) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N is N1 - N2.
value(V1 * V0, Asoc, N) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N is N1 * N2.
value(V1 / V0, Asoc, N) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N2 =\= 0,N is N1 div N2.
value(V1 mod V0, Asoc, N) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N2 =\= 0,N is N1 mod N2.

validate(V1 =:= V0, Asoc) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N1 =:= N2.
validate(V1 =\= V0, Asoc) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N1 =\= N2.
validate(V1 < V0, Asoc) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N1 < N2.
validate(V1 > V0, Asoc) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N1 > N2.
validate(V1 >= V0, Asoc) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N1 >= N2.
validate(V1 =< V0, Asoc) :-
    value(V1, Asoc, N1),value(V0, Asoc, N2),N1 =< N2.
validate((V1, V0), Asoc) :-
    validate(V1, Asoc),validate(V0, Asoc).
validate((V1; V0), Asoc) :-
    (validate(V1, Asoc) , ! ; validate(V0, Asoc)).

