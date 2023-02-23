% To run this, simply compile it
% with 
% -? [sentence_parser_grammar_syntax_version]
% then, the sentence can be queried with sentence([the, girl, sang, a, song, "."], []).
% which will indicate if the grammar contains that phrase
sentence --> nounPhrase, predicate, ["."].
nounPhrase --> determiner, noun.
predicate --> verb, nounPhrase.
predicate --> verb.
determiner --> [a].
determiner --> [the].
noun --> [boy] ; [girl] ; [cat] ; [telescope] ; [song] ; [feather].
verb --> [saw] ; [touched] ; [surprised] ; [sang].