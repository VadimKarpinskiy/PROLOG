nth_element([H|_], 1, H) :- !.
nth_element([_|L], N, Element) :-
    NewN is N - 1,
    nth_element(L, NewN, Element).