left_of(bike,camera).

left_of(butterfly,fish).
left_of(hourglass,butterfly).
left_of(pencil,hourglass).

above(smok,camera).
above(bike,pencil).
above(camera,butterfly).
above(fish,rak).
above(rak,makrela).

right_of(X,Y) :-
    left_of(Y,X).

below(X,Y) :-
    above(Y,X).

left_of_r(X,Y) :-
    left_of(X,Y).
left_of_r(X,Y) :-
    left_of(X,Z),
    left_of_r(Z,Y).

right_of_r(X,Y) :-
    right_of(X,Y).
right_of_r(X,Y) :-
    right_of(X,Z),
    right_of_r(Z,Y).

above_r(X,Y) :-
    above(X,Y).

above_r(X,Y) :-
    above(X,Z),
    above_r(Z,Y).

higher(D,A) :-
    above_r(D,A);
    (
       (
             above(D,F),
             above(A,M),
             higher(F,M)
        );
        above_r(D,_),
        \+ above_r(A,_)
    ).
