expr(E) --> term(E1), restexpr(E1,E).
restexpr(E1,plus(E1,E2)) --> ['+'], expr(E2).
restexpr(E1,minus(E1,E2)) --> ['-'], expr(E2).
restexpr(E,E) --> [ ].
term(T) --> num(T1), restterm(T1,T).
restterm(T1,times(T1,T2)) --> ['*'], term(T2).
restterm(T1,divides(T1,T2)) --> ['/'], term(T2).
restterm(T,T) --> [ ].
num(T) --> [1], {T = 1};
			[2], {T = 2};
			[3], {T = 3};
			[4], {T = 4};
			[5], {T = 5};
			[6], {T = 6};
			[7], {T = 7}.