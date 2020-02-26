ojciec(jozef,jezus).
matka(maryja,jezus).
mezczyzna(jozef).
mezczyzna(jezus).
kobieta(anna).
kobieta(maryja).
rodzic(jozef,jezus).
rodzic(jozef,anna).
rodzic(anna,marek).


jest_matka(X) :-
    matka(X,_);
    kobieta(X),rodzic(X,_).

jest_ojcem(X) :-
    ojciec(X,_);
    mezczyzna(X),rodzic(X,_).

jest_synem(X) :-
    mezczyzna(X),rodzic(_,X).

jest_corka(X) :-
    kobieta(X),rodzic(_,X).

siostra(X,Y) :-
    (jest_synem(Y);jest_corka(Y)),
    jest_corka(X),
    rodzic(Z,X),
    rodzic(Z,Y).

dziadek(X,Y) :-
    rodzic(X,Z),
    rodzic(Z,Y).

rodzenstwo(X,Y) :-
    rodzic(Z,X),
    rodzic(Z,Y).







