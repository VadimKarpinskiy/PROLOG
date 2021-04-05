% Family relationships

jest_matką(X,Y) :- jest_rodzicem(X,Y), 
                   jest_kobietą(X).

jest_ojcem(X,Y) :- jest_rodzicem(X,Y),
    			   jest_mężczyzną(X).

jest_krewnym(X, Y) :- jest_przodkiem(Z,X),
    				  jest_przodkiem(Z,Y),
    				  X \= Y.

jest_potomkiem(X, Y) :- jest_przodkiem(Y,X).

jest_rodzeństwem(X,Y) :- jest_rodzicem(Z,X),
                         jest_rodzicem(Z,Y), X \= Y.

jest_siostrą(X,Y) :- jest_rodzeństwem(X,Y),
    				 jest_kobietą(X).

% stryjenka - siostra ojca LUB żona brata ojca. brat ojca to stryj
jest_stryjenką(X,Y) :- jest_siostrą(X,Z), jest_ojcem(Z,Y).
jest_stryjenką(X,Y) :- jest_stryjem(Z,Y), jest_żoną(X,Z). 

jest_żoną(X,Y) :- jest_mężem(Y,X).

% stryj - brat ojca
jest_stryjem(X,Y) :- jest_rodzeństwem(X,O), jest_ojcem(O,Y), 
    				 jest_mężczyzną(X).

% ojciec żony LUB ojciec męża
jest_teściem(X,Y) :- jest_ojcem(X,Z), jest_żoną(Z,Y).
jest_teściem(X,Y) :- jest_ojcem(X,Z), jest_mężem(Z,Y).

jest_przodkiem(X,Y) :- jest_rodzicem(X,Y).

jest_przodkiem(X,Y) :- jest_rodzicem(Z,Y),
                       jest_przodkiem(X,Z).

jest_szwagrem(X, Y) :- jest_mężem(X,S), jest_siostrą(S,Y).
jest_szwagrem(X, Y) :- jest_mężem(Y,S), jest_siostrą(S,X).

% jest_rodzicem(imię rodzica, imię dziecka)
jest_rodzicem(kasia,robert).
jest_rodzicem(kasia,michał).
jest_rodzicem(tomek,robert).
jest_rodzicem(tomek,eliza).
jest_rodzicem(robert,miriam).

% jest_mężem(imię męża, imię żony)
jest_mężem(tomek, kasia).
jest_mężem(michał, faustyna).

% jest_kobietą(imię kobiety)
jest_kobietą(kasia).
jest_kobietą(eliza).
jest_kobietą(faustyna).

% jest_mężczyzną(imię mężczyzny)
jest_mężczyzną(tomek).
jest_mężczyzną(robert).
jest_mężczyzną(michał).