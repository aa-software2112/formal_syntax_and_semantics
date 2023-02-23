% To run this, simply compile it
% with 
% -? [sentence_parser_grammar_syntax_version]
% then, the sentence can be queried with sentence([the, girl, sang, a, song, "."], []).
% which will indicate if the grammar contains that phrase
% In this we also added several 
sentence(sent(N,P)) --> nounPhrase(N), predicate(P), ["."].
nounPhrase(nounph(D,N)) --> determiner(D), noun(N).
predicate(pred(V,N)) --> verb(V), nounPhrase(N).
predicate(pred(V)) --> verb(V).
determiner(det(a)) --> [a].
determiner(det(the)) --> [the].
noun(noun(boy)) --> [boy].
noun(noun(girl)) --> [girl].
noun(noun(cat)) --> [cat].
noun(noun(telescope)) --> [telescope].
noun(noun(song)) --> [song].
noun(noun(feather)) --> [feather].
verb(verb(saw)) --> [saw].
verb(verb(touched)) --> [telescope].
verb(verb(surprised)) --> [surprised].
verb(verb(sang)) --> [sang].