max_sum([],0).

max_sum([H|T],Sum):-
    max_sum(T,H,H,Sum).

max_sum([],_,Sum,Sum).

max_sum([H|T],Res,Max,Sum):-
    (Res > 0 ->  Res2 is Res + H;Res2 is H),
    (Res2 > Max -> Max2 is Res2 ; Max2 is Max),
    max_sum(T,Res2,Max2,Sum).
