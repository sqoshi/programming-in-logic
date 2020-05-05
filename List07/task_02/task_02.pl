:- consult('task_01.pl').

%split([a, b, c, d], OUT1, OUT2).
%split([a, b, c, d | A], OUT1, OUT2).
%merge_sort([5, 1, 3, 2, 4], X).
%merge_sort(X, Y), X = [4, 1, 3, 2].
%merge_sort([5, 1, 3, 2, 4 | A], X).

split(IN, OUT1, OUT2) :-
	freeze(IN,(IN = [Head | Tail]
		->	OUT1 = [Head | Tail1],split(Tail, OUT2, Tail1);OUT1 = [],OUT2 = [])).

merge_sort(IN, OUT) :-
	freeze(IN,(IN = [Head | Tail]
		->	freeze(Tail,(Tail \= []
			->	split(IN, List1, List2),
				merge_sort(List1, X),merge_sort(List2, Y),!,
				     merge(X, Y, OUT);OUT = [Head])); OUT = [])).


