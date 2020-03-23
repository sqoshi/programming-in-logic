% narzucone dzialania,
% dzielenie  z uwzglednieniem warunku y!=0
dzialanie(Wyrazenie,X,Y) :-
    Wyrazenie = X+Y.
dzialanie(Wyrazenie,X,Y) :-
    Wyrazenie = X-Y.
dzialanie(Wyrazenie,X,Y) :-
    Wyrazenie = X*Y.
dzialanie(Wyrazenie,X,Y) :-
    0 =\= Y,
    Wyrazenie = X/Y.

%Wstawia pomiedzy elementy z listy
%odpowiednie dzialania tak aby wyrazenie == wartosci.
wyrazenie(Lista,Wartosc,Wyrazenie):-
    buduj(Lista,X),
    Wartosc is X,
    Wyrazenie = X.

% jesli 1el to zwraca go
buduj([A],A).

%buduj drzewo:
% podziel na 2 czesci podana listę tak, aby dlugosc obu byla !=0
% i buduj dla ososbnych list,
% selekcjonuj dzialanie dzialanie.
buduj(List,A):-
    append(List1,List2,List),
    \+ length(List1,0),
    \+ length(List2,0),
    buduj(List1,X),
    buduj(List2,Y),
    dzialanie(A,X,Y).




