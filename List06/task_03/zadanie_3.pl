%a^n b^n
p1 --> [].
p1 --> [a], p1, [b].

%a^n b^n c^n
p2 --> a(Count), b(Count), c(Count).
a(0) --> [].
a(succ(Count)) --> [a], a(Count).
b(0) --> [].
b(succ(Count)) --> [b], b(Count).
c(0) --> [].
c(succ(Count)) --> [c], c(Count).
%a^n b^fib(n)
p3 --> a(Count), bFibbo(Count).

bFibbo(0) --> [].
bFibbo(succ(0)) --> [b].
bFibbo(succ(succ(Count))) --> bFibbo(succ(Count)), bFibbo(Count).

% phrase(p(L1), L2, L3) => L1 +L3 <=> L2
p([]) --> [].
p([X|Xs]) --> [X], p(Xs).