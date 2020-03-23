% 0+X = X
regula(X,+,Y,Y):-
    number(X),
    X=:=0,!.
%X+0 = X
regula(Y,+,X,Y):-
    number(X),
    X=:=Y,!.

% X-X = 0
regula(X,-,Y,0):-
    Y = X.

% X * 0 = 0
regula(_,*,0,0).

% 0*X = 0
regula(0,*,_,0).

% X/X =1
regula(X,/,X,1):-
    number(X),
    X=\=0.
regula(X,/,X,1):-
    \+number(X).

% X*Y / Y = X
regula(X*Y,/,Y,X):-
    number(Y),
    Y=\=0.
regula(X*Y,/,Y,X):-
    \+number(Y).

%Y*X / Y = X ??????
regula(Y*X,/,Y,X):-
    number(Y),
    Y=\=0.
regula(Y*X,/,Y,X):-
    \+number(Y).

uprosc(Single,Single):-
    Single =.. List,
    List = [_ | [] ].

uprosc(Wyrazenie,Wynik):-
    Wyrazenie =..List,
    List = [Op|_],
    select(Op,List,ListWithoutOp),
    ListWithoutOp = [El1 | _ ],
    select(El1,ListWithoutOp,ListWithoutEl1),
    ListWithoutEl1 = [El2 | _],
    regula(El1,Op,El2,Wynik).

uprosc(Wyrazenie,Wynik):-
    Wyrazenie =.. List,
    List = [Op|_],
    select(Op,List,ListWithoutOp),
    ListWithoutOp = [El1 | _],
    select(El1,ListWithoutOp,ListWithoutEl1),
    ListWithoutEl1 = [ El2 | _ ],
    \+ regula(El1,Op,El2,_),
    uprosc(El1, Wyn1),
    uprosc(El2,Wyn2),
    regula(Wyn1,Op,Wyn2,Wynik).
