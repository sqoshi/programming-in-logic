board(PositionsList) :-
  length(PositionsList, Length),
  display(Length, Length, PositionsList),
  cala_ramka(Length),!.

hetmany(N, P) :-
  numlist(1, N, L),
  permutation(L, P),
  \+ incorrect(P).

incorrect(P) :-
  append(_, [X | L1], P),append(L2, [Y | _], L1),
  length(L2, K),
  abs(X - Y) =:= K + 1.


cala_ramka(Size) :-write("+"),ramka(Size),write("\n"),true.
ramka(0).
ramka(Size) :- Size > 0,write("-----+"),NewSize is Size - 1,ramka(NewSize),true.

display(0,_,_).
display(N, K, L) :-
    N > 0, N mod 2 =:= 0,
    cala_ramka(K),
    printLightSet(N, L),
    printLightSet(N, L),
    NewN is N - 1,
    display(NewN, K, L).
display(N, K, L) :-
    N > 0,
    N mod 2 =:= 1,
    cala_ramka(K),
    printDarkSet(N, L),
    printDarkSet(N, L),
    NewN is N - 1,
    display(NewN, K, L).



printDark(_, []).
printDark(Ind, [Head|Tail]) :-
  Ind =:= Head,
  write(":###:|"),
  printLight(Ind, Tail).
printDark(Ind, [Head|Tail]) :-
  Ind =\= Head,
  write(":::::|"),
  printLight(Ind, Tail).


printLight(_,[]).
printLight(Ind, [H|T]) :-
  Ind =\= H,
  write("     |"),
  printDark(Ind, T).
printLight(Ind, [H|T]) :-
  Ind =:= H,
  write(" ### |"),
  printDark(Ind, T).

printDarkSet(Ind, L) :-
  write("|"),
  printDark(Ind, L),
  write("\n").

printLightSet(Ind, L) :-
  write("|"),
  printLight(Ind, L),
  write("\n").
