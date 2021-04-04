% Napraw predykat jest_krewnym/2 tak, żeby każda para krewnych pojawiała się w 
% wynikach tylko raz. 
% Użyj w tym celu niedawno poznanych predykatów assert i retractall.

:- dynamic dodane/2.
jest_przodkiem(X,Y) :- jest_rodzicem(X,Y).
jest_przodkiem(X,Y) :- jest_rodzicem(Z,Y),
                       jest_przodkiem(X,Z).

jest_krewnym(X,Y) :- jest_przodkiem(Z,X),
                     jest_przodkiem(Z,Y),
    				 X \= Y,
        			 nie_dodane(X,Y),		%% sprawdzamy, żeby jeszcze nie było ich w bazie
    				 assert(dodane(X,Y)).	% dodajemy krewnych do bazy


nie_dodane(X,Y) :- \+ dodane(X,Y), \+ dodane(Y,X).

% jest_rodzicem(imię rodzica, imię dziecka)
jest_rodzicem(kasia,robert).
jest_rodzicem(kasia,michał).
jest_rodzicem(tomek,robert).
jest_rodzicem(tomek,eliza).
jest_rodzicem(robert,miriam).