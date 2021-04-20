convert(X, Y) :- Y is X*X.

% map of an empty list gives us empty list
map([],[]).

map([Element | List], [ConvertedElement|ResultList]) :-
    convert(Element, ConvertedElement),
    map(List,ResultList).


