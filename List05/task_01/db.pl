token(write).
token(read).
token(if).
token(then).
token(else).
token(mod).
token(do).
token(while).
token(od).
token(and).
token(or).
token(fi).

leave(' ').
leave('\n').
leave('\t').

type(Symbol, Type) :- char_type(Symbol, upper),Type = id.
type(Symbol, Type) :- char_type(Symbol, lower) ,Type = token.
type(Symbol, Type) :- member(Symbol, [;, +, -, *, /,'(', ')', <, >, =, :]),Type = sep.
type(Symbol, Type) :- atom_number(Symbol, N),integer(N),Type = int.

sign(X, Y, id) :- X = id(Y).
sign(X, Y, token) :- token(Y),X = token(Y).
sign(X, Y, sep) :- member(Y, [ ;, +, -, *, /,'(', ')', <, >, =<, >=, :=, =, /=]),X = sep(Y).
sign(X, Y, int) :- atom_number(Y, N),integer(N),N >= 0,X = int(N).


scanner(Stream, Tokens) :-
    current_input(In),
    set_input(Stream),
    scan(Tokens),
    set_input(In).

scan(Expr) :-
    get_char(Symbol),
    scanNext(Symbol, Expr), !.
scanNext(end_of_file, []) :- !.
scanNext(Symbol, X) :-
    leave(Symbol), !,
    get_char(NextSymbol),
    scanNext(NextSymbol, X).
scanNext(Symbol, [H|T]) :-
    type(Symbol, Type),
    scanWord(Symbol, NextSymbol, '', S, Type),
    sign(H, S, Type),
    scanNext(NextSymbol, T).

scanWord(end_of_file, end_of_file, N, N, _) :- !.
scanWord(Symbol, Symbol, N, N, _) :- leave(Symbol), !.
scanWord(Symbol, Symbol, N, N, Type) :- \+ type(Symbol, Type), !.
scanWord(Symbol1, Symbol3, N1, N, Type) :-
    atom_concat(N1, Symbol1, N2),
    get_char(Symbol2),
    scanWord(Symbol2, Symbol3, N2, N, Type).









