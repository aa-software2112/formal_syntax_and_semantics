% This example can be found on page 51
decSeq(declarations(T)) --> decl(T).
decl([declaration(Vars, Type) | Tail]) --> [var], varList(Vars), [":"], type(Type), [";"], decl(Tail).
decl([]) --> [].

varList(variables([V|Tail])) --> [var(V)], vars(Tail).
vars([V|Tail]) --> [","], [var(V)], vars(Tail).
vars([]) --> []. % The case where there is no ","


type(typ(Type)) --> {t(Type)}, [Type].

t(integer).
t(boolean). 