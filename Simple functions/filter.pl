% Filter condition
condition(X) :- X > 0.

% base case - filtering empty list gives us as empty list
filter([],[]).

% element satisfies the condition - add it to the beginning of our filtered list
filter([Good|Tail], [Good|FilteredTail]) :-
  condition(Good),
  filter(Tail, FilteredTail).

% element does not satisfy the condition - skip it
filter([Bad|Tail], FilteredTail) :-
  \+ condition(Bad),
  filter(Tail, FilteredTail).
