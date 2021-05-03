list_number([],0).
list_number('[|]'(_,X),Y) :- list_number(X,NewY),
    						 Y is NewY + 1.

list_add([],L2,L2).
list_add('[|]'(H,L1), L2,'[|]'(H,L3)) :- list_add(L1,L2,L3).

list_number_mfr(L, Length) :- foldl(increment, L, 0, Length).

list_add_mfr(L1, L2, L3) :- foldl(add, L1, [], Reverse), foldl(add, Reverse, L2, L3).

increment(_, Acc, Res) :- Res is Acc + 1.

add(Item, Acc, [Item|Acc]). 

