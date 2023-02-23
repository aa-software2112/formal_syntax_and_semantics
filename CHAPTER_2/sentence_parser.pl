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
sentence(K, L) :- nounPhrase(K, M), predicate(M, N), period(N, L).
nounPhrase(K, L) :- determiner(K, M), noun(M, L).
predicate(K, L) :- verb(K, M), nounPhrase(M, L).
predicate(K, L) :- verb(K, L).
determiner(K, L) :- a(K, L).
determiner(K, L) :- the(K, L).
noun(K, L) :- has(boy/2), boy(K, L).
noun(K, L) :- has(girl/2), girl(K, L).
noun(K, L) :- has(cat/2), cat(K, L).
noun(K, L) :- has(telescope/2), telescope(K, L).
noun(K, L) :- has(song/2), song(K, L).
noun(K, L) :- has(feather/2), feather(K, L).
verb(K, L) :- has(saw/2), saw(K, L).
verb(K, L) :- has(touched/2), touched(K, L).
verb(K, L) :- has(surprised/2), surprised(K, L).
verb(K, L) :- has(sang/2), sang(K, L).

