podnies_widelec(Identifier, Widelec, Side):-
	atom_concat('w', Widelec, M),
	mutex_lock(M),
	(Side = lewy
	->printer(Identifier, 'podniosl lewy Widelec');printer(Identifier, 'podniosl prawy Widelec')).

odloz_widelec(Identifier, Widelec, Side):-
	atom_concat('w', Widelec, M),
	(Side = lewy
	->printer(Identifier, 'odklada lewy Widelec');printer(Identifier, 'odklada prawy Widelec')),
	mutex_unlock(M).


mysl(Identifier) :-
	printer(Identifier, "mysli"),
	random_between(1, Identifier, R),
	sleep(R).

jedz(Identifier):-
	printer(Identifier, "je"),
	random_between(1, Identifier, R),
	sleep(R).


begin(Identifier) :-
	mysl(Identifier),
	Lewy is Identifier,
	Prawy is Identifier + 1 mod 5, % 5os
	printer(Identifier, "chce prawy Widelec"),
	podnies_widelec(Identifier, Prawy, prawy),
	printer(Identifier, "chce lewy Widelec"),
	podnies_widelec(Identifier, Lewy, lewy),
	jedz(Identifier),
	odloz_widelec(Identifier, Prawy, prawy),
	odloz_widelec(Identifier, Lewy, lewy),
	begin(Identifier).

printer(Identifier, Akcja):-
	mutex_lock(druk),
	format('[~w] ~w~n', [Identifier, Akcja]),
	mutex_unlock(druk),
	sleep(3).

filozofowie :-
	thread_create(begin(0), Identifier1, []),
	thread_create(begin(1), Identifier2, []),
	thread_create(begin(2), Identifier3, []),
	thread_create(begin(3), Identifier4, []),
	thread_create(begin(4), Identifier5, []),
	thread_join(Identifier1, _),
	thread_join(Identifier2, _),
	thread_join(Identifier3, _),
	thread_join(Identifier4, _),
	thread_join(Identifier5, _).

