:- consult('zadanie_1.pl').
:- consult('scanner.pl').
:- consult('interpreter.pl').

wykonaj(File) :-
    open(File, read, S),
	scanner(S, Tok),
	close(S),
    phrase(program(Program), Tok),
	interpreter(Program).