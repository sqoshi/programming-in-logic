lista(N, List) :-
		It is N + 1,
		iterate(1, It, [], [], List).

iterate(N, N, [], [], []).

iterate(It, N, List1, List2, [Head|Tail]) :-
		select(Head, List1, List1WithoutHead),
		iterate(It, N, List2, List1WithoutHead, Tail).

iterate(It, N, List1, List2, [Head|Tail]) :-
		It < N,
		Head = It,
		Y is It+1,
		iterate(Y, N, [It|List2], List1, Tail).
