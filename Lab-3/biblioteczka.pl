:- dynamic present/2.

ksiazka(16, 'Flatlandia', autor('Edwin Abbott Abbott', 1838-1926), wydanie('Seel & Co', 1884)). 
ksiazka(28, 'R.U.R.', autor('Karel Čapek', 1890-1938), wydanie('Players Press', 2002)).
ksiazka(29, 'Daszeńka, czyli żywot szczeniaka', autor('Karel Čapek', 1890-1938), wydanie('Nasza Księgarnia', 1989)).
ksiazka(34, 'Kobieta z wydm', autor('Kobo Abe', 1924-1993), wydanie('Wydawnictwo Znak', 2007)).
ksiazka(56, 'Zamek', autor('Franz Kafka', 1883-1924), wydanie('Zielona Sowa', 2001)).
ksiazka(87, 'Gargantua i Pantagruel', autor('Francois Rabelais', 1494-1553), wydanie('Siedmioróg', 2004)).

same_period(YoB1-YoD1, YoB2-YoD2) :- YoB1 =< YoD2, YoB2 =< YoD1.
absent(Autor1, Autor2) :- \+ present(Autor1, Autor2),
    					    \+ present(Autor2, Autor1),
    					    assert(present(Autor1,Autor2)).

zapytanie_1(Autorzy) :- findall(Autor, ksiazka(_,_,Autor, _), Autors),
						sort(Autors, Autorzy).

zapytanie_2(Tytuly) :- findall(Title, (ksiazka(_,Title,autor(_,_-YoD),wydanie(_,YoP)),YoP>YoD), Tytuly).

zapytanie_3(AutorzyTytuly) :- findall(Name - Books, 
        bagof(Title, (A,B,C)^ksiazka(A, Title, autor(Name, B), C), Books), AutorzyTytuly).

zapytanie_4(ParyAutorow) :- findall(Name1-Name2, 
                                    (ksiazka(_,_,autor(Name1,YoB1-YoD1),_),
                                     ksiazka(_,_,autor(Name2,YoB2-YoD2),_),
                                     same_period(YoB1-YoD1, YoB2-YoD2),
                                     Name1 \= Name2,
                                     absent(Name1,Name2)),
                                     AuthorPairs),
    						sort(AuthorPairs,ParyAutorow),
							retractall(present(_,_)).


long_liver(Name - (YoB - YoD), _ - AccAge, Name - Age) :- Age is YoD - YoB,
                                                               Age > AccAge.

long_liver(_ - (YoB - YoD), Name - AccAge, Name - AccAge) :- Age is YoD - YoB,
                                                                  Age < AccAge.
                                                                 
zapytanie_5(Dlugowieczny) :- findall(Name - Years, ksiazka(_,_, autor(Name, Years), _), Autors),
                             foldl(long_liver, Autors, "None" - 0, Dlugowieczny - _).

