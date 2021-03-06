prime(Low,High,N) :- between(Low,High,N),is_prime(N).

equal(X,Y) :-
    X=Y,!.

is_not_prime(N) :-
    S is 2,
    M is N-1,
    between(S,M,X),
    0 is mod(N,X).

is_prime(N) :-
    not(is_not_prime(N)).
