% This example can be found on page 56
% Some of this question doesn't make sense For example, a valid expression is == and ==. 
% Did my best to work this example, however
booleanExpr(T) --> bTerm(T1), restExpr(T1, T).
restExpr(T1, T) --> [or], bTerm(T2), restExpr(oor(T1, T2), T).
restExpr(T, T) --> [].

% This will create a LEFT ASSOCIATIVE TREE
% This is due to T1 continually being stored in the
% leftmost part of the tree.
bTerm(T) --> bElem(T1), restTerm(T1, T).
restTerm(T1, T) --> [and], bElem(T2), restTerm(aand(T1, T2), T).
% restTerm(T1, T) --> bElem(T2), restTerm(bexp(T1, T2), T).
restTerm(T, T) --> [].


% This will create a RIGHT ASSOCIATIVE TREE
% The main difference is that this restTermRAssoc rule creates
% the aand(value, Tree), where the rightmost part of the aand will be
% filled at lower levels
bTermRAssoc(T) --> bElem(T1), restTermRAssoc(T1, T).
restTermRAssoc(T1, aand(T1, T)) --> [and], bElem(T2), restTermRAssoc(T2, T).
restTermRAssoc(T, T) --> [].


bElem(elem(true)) --> [true].
bElem(elem(false)) --> [false].
bElem(elem(T)) --> {v(T)}, [T].
bElem(compare(T)) --> {comp(T)}, [T].
bElem(nt(T)) --> ["not", "("], booleanExpr(T), [")"].
bElem(T) --> ["("], booleanExpr(T), [")"].


v(a).
v(b).
comp("==").
comp("!=").