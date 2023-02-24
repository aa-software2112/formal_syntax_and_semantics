% Example 3 on page 50
% This is an extension problem to example 3 which now outputs the AST 
% of the roman numerals

test(Tree, In) :- atom_chars(In, Lst), roman(Tree, Lst, []).
get(Tree, Out) :- roman(Tree, Lst, []), atom_chars(Out, Lst).
checkSize(CurrentSize, Limit, NextSize) :- NextSize is CurrentSize + 1, NextSize =< Limit.

roman(input(H, T, U)) --> hundreds(H), tens(T), units(U).

hundreds(hundr(H)) --> ['C','C','C'], {H = 'CCC'};
						['C','C'], {H = 'CC'};
						['C','D'], {H = 'CD'};
						['C'], {H = 'C'};
						[], {H = []}.
tens(tns(T)) --> ['X', 'L'], {T = 'XL'};
					['X', 'C'], {T = 'XC'};
					['L'], lowtens(0, R), {atom_concat('L', R, T)};
					lowtens(0, T).
					
lowtens(WC, LT) --> {checkSize(WC, 3, WC2)}, lowtens(WC2, R), ['X'], {atom_concat('X', R, LT)};
					[], {LT = ''}.

units(unts(U)) --> lowunits(0, U);
			['I', 'V'], {U = 'IV'};
			['V'], lowunits(0, R), {atom_concat('V', R, U)};
			['I', 'X'], {U = 'IX'}.
			
lowunits(WC, LU) --> [], {LU = ''}; 
					{checkSize(WC, 3, WC2)}, lowunits(WC2, R), ['I'], {atom_concat('I', R, LU)}.