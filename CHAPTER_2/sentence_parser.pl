% Here, we enter the sentence
% [the, girl, sang, a, song, .]
% 1 -- the -- > 2 -- girl --> 3 -- sang --> 4 -- a --> 5 -- song --> 6
% -- . -->

the(1, 2).
girl(2, 3).
sang(3, 4).
a(4, 5).
song(5, 6).
period(6, 7).

has(FactType) :- current_predicate(FactType).


% Finds the sentence composed of a noun phrase from index K -> M, then
% the predicate (Verb) from M -> N, and the period (last character),
% from N -> L
% The valid sentences can be generated via ?- sentence(X, []).
% and a sentence queried via sentence([the, girl, sang, a, song, '.'], []).
% which uses "difference lists".
sentence(K, L) :- nounPhrase(K, M), predicate(M, R), 'C'(R,'.',L).
nounPhrase(K, L) :- determiner(K, M), noun(M, L).
predicate(K, L) :- verb(K, M), nounPhrase(M, L).
predicate(K, L) :- verb(K, L).
determiner(K, L) :- 'C'(K, a, L).
determiner(K, L) :- 'C'(K, the, L).
noun(K, L) :- 'C'(K, boy, L).
noun(K, L) :- 'C'(K, girl, L).
noun(K, L) :- 'C'(K, cat, L).
noun(K, L) :- 'C'(K, telescope, L).
noun(K, L) :- 'C'(K, song, L).
noun(K, L) :- 'C'(K, feather, L).
verb(K, L) :- 'C'(K, saw, L).
verb(K, L) :- 'C'(K, touched, L).
verb(K, L) :- 'C'(K, surprised, L).
verb(K, L) :- 'C'(K, sang, L).
'C'([H|T],H,T).
