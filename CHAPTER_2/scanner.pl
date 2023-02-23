digit(C) :- 48 =< C, C =<57. % 0-9 in ASCII, for reading TEXT

% get0 reads from the input stream
% name fills N with the numerical form of the characters in the list
% [C|Lc]
getnum(C, N) :- digit(C), get0(D), restnum(D, Lc), name(N, [C|Lc]).
restnum(C, [C|Lc]) :- digit(C), get0(D), restnum(D, Lc).
restnum(C, []).

lower(C) :- 97 =< C, C =<122. % a-z
upper(C) :- 65 =<C, C=<90. % A-Z
space(32).
tabch(9).
period(46).
slash(47).
endline(10).
endfile(26).
endfile(-1).
whitespace(C) :- space(C); tabch(C); endline(C).
idchar(C) :- lower(C); digit(C).

scan([T|Lt]) :- tab(4), getch(C), gettoken(C, T, D), restprog(T, D, Lt).
% Moves past the next line, or reads the current character (and
% re-displays it)
getch(C) :- get0(C), (endline(C), nl, tab(4); endfile(C), nl; put(C)).
restprog(eop, C, []).
restprog(T, C, [U|Lt]) :- gettoken(C, U, D), restprog(U, D, Lt).

% Single character symbols
single(40,lparen). single(41,rparen). single(42,times).
single(43,plus). single(44,comma). single(45,minus).
single(47,divides). single(59,semicolon). single(61,equal).

% First character that may appears in double-character symbols like
% the "<" in <=, for example
double(58,colon). double(60,less). double(62,grtr).

% For those two-character symbols
pair(58,61,assign). % :=
pair(60,61,lteq). % <=
pair(60,62,neq). % <>
pair(62,61,gteq). % >=

% reserved words
reswd(program). reswd(is). reswd(begin). reswd(end).
reswd(var). reswd(integer). reswd(boolean). reswd(read).
reswd(write). reswd(while). reswd(do). reswd(if).
reswd(then). reswd(else). reswd(skip). reswd(or).
reswd(and). reswd(true). reswd(false). reswd(not).


% If C is a digit, get the next character, and attempt to form the
% remaining digit into Lc, convert to a number in N, and
% return as a prolog fact "num(N)"
gettoken(C, num(N), E) :- digit(C), getch(D), restnum(D, Lc, E), name(N, [C|Lc]).
restnum(C, [C|Lc], E) :- digit(C), getch(D), restnum(D, Lc, E).
restnum(C, [], C). % When C is not a digit, this value is reached, and C is returned UPWARDS so that it may be used as the next character in the scanning process

% For handling symbols... If it's not a reserved word (reswd), then it's
% an identifier
gettoken(C, T, E) :- lower(C), getch(D), restid(D, Lc, E), name(Id, [C|Lc]), (reswd(Id), T=Id; T=ide(Id)).
restid(C, [C|Lc], E) :- idchar(C), getch(D), restid(D, Lc, E).
restid(C, [], C).


gettoken(C, T, D) :- single(C, T), getch(D).
% Grab the pair-symbol, otherwise just return the single-character as a
% token
gettoken(C, T, E) :- double(C, U), getch(D), (pair(C, D, T), getch(E); T=U, E=D).
gettoken(C, eop, 0) :- endfile(C).
% Skip whitespace
gettoken(C, T, E) :- whitespace(C), getch(D), gettoken(D, T, E).
% Could not find a valid character for this language (WREN).
gettoken(C, T, E) :- write('Illegal character: '), put(C), nl, abort.


go :- nl, write('>>> Scanning Wren <<<'), nl, nl,
    write('Enter name of source file: '), nl, getfilename(FileName), nl,
    see(FileName), scan(Tokens), seen, write('Scan successful'), nl, nl, write(Tokens), nl.

getfilename(W) :- get0(C), restfilename(C, Cs), name(W, Cs).
restfilename(C, [C|Cs]) :- filechar(C), nl, get0(D), restfilename(D, Cs).
restfilename(C, []).

filechar(C) :- lower(C); upper(C); digit(C); period(C); slash(C).






























