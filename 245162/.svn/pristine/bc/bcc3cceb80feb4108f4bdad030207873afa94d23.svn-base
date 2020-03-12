srodkowy(L,_):- %parzysta
    length(L,R),
    0 is mod(R,2),
    1 is 2,!.

srodkowy(L,S):- %nieparzysta dlugosc
    append(LL,LP,L),
    length(LL,NL),
    length(LP,NP),
    NL is NP +1,
    reverse(LL,[S|_]).
