% Example 3 on page 50

test(In) :- atom_chars(In, Lst), roman(Lst, []).
get(Out) :- roman(Lst, []), atom_chars(Out, Lst).
checkSize(CurrentSize, Limit, NextSize) :- NextSize is CurrentSize + 1, NextSize =< Limit.
roman --> hundreds, tens, units.
hundreds --> ['C'], ['C'], ['C']; ['C'], ['C']; ['C'], ['D']; ['C']; [].
tens --> ['X'], ['L']; ['X'], ['C']; ['L'], lowtens(0); lowtens(0).
lowtens(WC) --> {checkSize(WC, 3, WC2)}, lowtens(WC2), ['X']; [].
units --> lowunits(0); ['I'], ['V']; ['V'], lowunits(0); ['I'], ['X'].
lowunits(WC) --> []; {checkSize(WC, 3, WC2)}, lowunits(WC2), ['I'].