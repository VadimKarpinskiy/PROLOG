% power(Base, Power, Result)
% any number raised to the power of 0, is 1 (let`s assume 0^0 is 1, mathematicians still debate about it
power(_, 0, 1).
% In other case we decrease the power
power(Base, Power, Result) :-
  Power > 0,
  NewPower is Power - 1,
  power(Base, NewPower, NewResult),
  Result is NewResult * Base.

factorial(0,1).
factorial(Number, Result) :-
    Number > 0,
    NewNumber is Number - 1,
    factorial(NewNumber, NewResult),
    Result is NewResult * Number.