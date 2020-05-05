% nalezy skompilowac scanner.pl i odaplic test(PROGRAM)
program([]) --> [].
program([INSTRUKCJA|PROGRAM]) --> instrukcja(INSTRUKCJA), [sep(';')], program(PROGRAM).

instrukcja(assign(IDENTYFIKATOR, WYRAZENIE)) --> [id(IDENTYFIKATOR), sep(':=')], wyrazenie(WYRAZENIE).
instrukcja(read(IDENTYFIKATOR)) -->[token(read), id(IDENTYFIKATOR)].
instrukcja(write(WYRAZENIE)) --> [token(write)], wyrazenie(WYRAZENIE).
instrukcja(if(WARUNEK, PROGRAM)) --> [token(if)], warunek(WARUNEK), [token(then)], program(PROGRAM), [token(fi)].
instrukcja(if(WARUNEK, PROGRAM_A, PROGRAM_B)) --> [token(if)], warunek(WARUNEK), [token(then)], program(PROGRAM_A), [token(else)], program(PROGRAM_B), [token(fi)].
instrukcja(while(WARUNEK, PROGRAM)) --> [token(while)], warunek(WARUNEK), [token(do)], program(PROGRAM), [token(od)].

wyrazenie(SKLADNIK + WYRAZENIE) --> skladnik(SKLADNIK), [sep('+')], wyrazenie(WYRAZENIE).
wyrazenie(SKLADNIK - WYRAZENIE) --> skladnik(SKLADNIK), [sep('-')], wyrazenie(WYRAZENIE).
wyrazenie(SKLADNIK) --> skladnik(SKLADNIK).

skladnik(CZYNNIK * SKLADNIK) --> czynnik(CZYNNIK), [sep('*')], skladnik(SKLADNIK).
skladnik(CZYNNIK / SKLADNIK) --> czynnik(CZYNNIK), [sep('/')], skladnik(SKLADNIK).
skladnik(CZYNNIK mod SKLADNIK) --> czynnik(CZYNNIK), [token(mod)], skladnik(SKLADNIK).
skladnik(CZYNNIK) --> czynnik(CZYNNIK).

czynnik(id(IDENTYFIKATOR)) --> [id(IDENTYFIKATOR)].
czynnik(int(LICZBANATURALNA)) --> [int(LICZBANATURALNA)].
czynnik((WYRAZENIE)) --> [sep('(')], wyrazenie(WYRAZENIE), [sep(')')].

warunek((KONIUNKCJA ; WARUNEK)) --> koniunkcja(KONIUNKCJA), [token(or)], warunek(WARUNEK).
warunek(KONIUNKCJA) --> koniunkcja(KONIUNKCJA).

koniunkcja((PROSTY, KONIUNKCJA)) --> prosty(PROSTY), [token(and)], koniunkcja(KONIUNKCJA).
koniunkcja(PROSTY) --> prosty(PROSTY).

prosty(WYRAZENIE_A =:= WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('=')], wyrazenie(WYRAZENIE_B).
prosty(WYRAZENIE_A =\= WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('/=')], wyrazenie(WYRAZENIE_B).
prosty(WYRAZENIE_A < WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('<')], wyrazenie(WYRAZENIE_B).
prosty(WYRAZENIE_A > WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('>')], wyrazenie(WYRAZENIE_B).
prosty(WYRAZENIE_A >= WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('>=')], wyrazenie(WYRAZENIE_B).
prosty(WYRAZENIE_A =< WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('=<')], wyrazenie(WYRAZENIE_B).
prosty(WYRAZENIE_A < WYRAZENIE_B) --> wyrazenie(WYRAZENIE_A), [sep('<')], wyrazenie(WYRAZENIE_B).
prosty((WYRAZENIE)) --> [sep('(')], wyrazenie(WYRAZENIE), [sep(')')].
