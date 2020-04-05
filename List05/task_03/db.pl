browse(Expression) :-
    prompt(X, 'command: '),
    browse(Expression, [1]),
    prompt(_, X).
browse(_, []).
browse(Expression, Postion) :-
    Postion \= [],
    display(Expression, Postion),
    nl(),read(Command),nl(),
    move(Expression, Command, Postion, NextPosition),
    browse(Expression, NextPosition).


printExpression(Expression, []) :-
        print(Expression).
printExpression(Expression, [H|T]) :-
        Expression =.. [_ | A],
        point(H, NExpression, A),
        printExpression(NExpression, T).
display(Expression, Postion) :-
            reverse(Postion, [1|NextPosition]),
            printExpression(Expression, NextPosition).

point(1, H, [H|_]).
point(N, X, [_|T]) :-
        N > 1,NewN is N-1,
        point(NewN, X, T).

check(_, []).
check(Expression, [H|T]) :-
            functor(Expression, _, Result),
            H =< Result,
            Expression =.. [_ | A],
            point(H, TExpression, A),
            check(TExpression, T).

validate(X):- member(X, [i,o,n,p]),!.

move(_, o, [1], []).
move(_, o, [_|Rest], Rest).
move(_, Command, Rest, Rest) :- \+ validate(Command).
move(Expression, i, Rest, [1|Rest]) :-
    reverse([1|Rest], [1|T]),
    check(Expression, T).
move(Expression, i, Rest, Rest) :-
    reverse([1|Rest], [1|T]),
    \+ check(Expression, T).
move(Expression, p, [H|Rest], [NewH|Rest]) :-
        NewH is H-1,
        reverse([NewH|Rest], [1|T]),
        check(Expression, T).
move(Expression, p, [H|Rest], [H|Rest]) :-
        NewH is H-1,
        reverse([NewH|Rest], [1|T]),
        \+ check(Expression, T).
move(Expression, n, [H|Rest], [NewH|Rest]) :-
    NewH is H+1,
    reverse([NewH|Rest], [1|T]),
    check(Expression, T).
move(Expression, n, [H|Rest], [H|Rest]) :-
    NewH is H+1,
    reverse([NewH|Rest], [1|T]),
    \+ check(Expression, T).
