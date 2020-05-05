merge(IN1, IN2, OUT) :-
	freeze(IN1,
		freeze(IN2,
			(IN1 = [Head1 | Tail1]
				-> (IN2 = [Head2 | Tail2]
					-> ( Head1 =< Head2
					        -> OUT = [Head1 | ElOut1],merge(Tail1, IN2, ElOut1) ; OUT = [Head2 | ElOut2],merge(IN1, Tail2, ElOut2)
					    );OUT = IN1
					);OUT = IN2 ))).
