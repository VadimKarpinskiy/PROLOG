:- dynamic present/2.

absent(X, Y) :- \+ present(X, Y),
    			\+ present(Y, X),
    			assert(present(X,Y)).

% to zapytanie powinno znalezc list krewnych bez duplikatow
% zmienna Krewni powinna docelowo zawierać listę par <imię1> - <imię2>, np.
% [ mateusz - anna, jozef - adolf ]
lista_krewnych(Krewni) :- findall(X-Y, (jest_krewnym(X,Y), absent(X,Y)), Repetitions),
    					  sort(Repetitions,Krewni).



% to zapytanie powinno wypisac krewnych z listy Krewni
% kazda para powinna byc wypisana w osobnej linijce
% przykladowe wyjscie:
% mateusz-anna
% jozef-adolf
wypisz_krewnych([]) :- !.
wypisz_krewnych([H | Krewni]) :- format('~w\n', H),
    							 wypisz_krewnych(Krewni).

