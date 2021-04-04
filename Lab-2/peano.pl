% Peano Arithmetics

peano_number(zero, 0).
peano_number(s(X), Y) :- peano_number(X, NewY),
    					 Y is NewY + 1.

peano_add(X, zero, X).
peano_add(X, s(Y), s(Z)) :- peano_add(X,Y,Z).

peano_substract(X, Y, Z) :- peano_add(Z, Y, X).

peano_times(X, zero, zero).
peano_times(zero, X, zero).
peano_times(X, s(Y), Z) :- peano_times(X, Y, R),
    									 peano_add(R, X, Z).

peano_greater_than(X, Y) :- peano_substract(X,Y,R),
    						Result \= zero.

% A = B*C + D
% D = A - B - B - ...
peano_mod(_, zero, false).
peano_mod(zero, _, zero).
peano_mod(_, s(zero), zero).
peano_mod(X, Y, Z) :- peano_substract(X,Y,R),
 					  (peano_greater_than(R,Y) -> peano_mod(R,Y,Z); Z = R).

peano_div(_, zero, false).
peano_div(zero, _, zero).
peano_div(_, s(zero), zero).
peano_div(X,Y,s(Z)) :- peano_substract(X,Y,R),
    				   (peano_greater_than(R,Y) -> peano_div(R,Y,Z);
                       	R = Y ->  Z = s(zero);
                        Z = zero).
    				
peano_is_even(zero).
peano_is_even(s(s(X))) :- peano_is_even(X).

peano_is_odd(s(zero)).
peano_is_odd(s(s(X))) :- peano_is_odd(X).
