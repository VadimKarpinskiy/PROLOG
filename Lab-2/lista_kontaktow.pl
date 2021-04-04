% Uzupełnij plik lista_kontaktow.pl zgodnie z komentarzami. 
% Program powinien być w stanie dodawać/usuwać/wypisywać znajomych.

:- dynamic jest_znajomym/1.

% Główna pętla programu:
% - wczytuje komendę
% - przetwarza komendę
% - zapętla się ;)
main :- 
    read_command(Command),
    process_command(Command),
    main.

is_command(add).
is_command(del).
is_command(exit).
is_command(list).
is_command(help).

process_command(X) :- \+ is_command(X), writeln("Nieznana komenda").

% Predykat pobierający komendą ze standardowego wejścia
% Dostępne komendy:
% - "add" - dodaj znajomego
% - "del" - usuń znajomego
% - "list" - wypisz znajomych
% - "help" - wyświetl listę komend
% - "exit" - wyjdź z programu
read_command(Command) :- read(Command).

% Predykat realizujący komendę 'help'
% Potrzeba jeszcze czterech innych komend,
% W przypadku nierozpoznoznanej komendy, program powinien
% wypisać informacje, że nie zna podanej komendy i kontynuować 
process_command(help) :- 
    writeln("Lista komend:"),
    writeln("- 'add' - dodaj znajomego"),
    writeln("- 'del' - usuń znajomego"),
    writeln("- 'list' - wypisz wszystkich znajomych"),
    writeln("- 'help' - wyświetl listę komend"),
    writeln("- 'exit' - zakończ program").    

% Misja: napisz kod realizujący brakujące komendy!
process_command(add) :-
    writeln("Podaj imię znajomego: "),
    read(X),
    assert(jest_znajomym(X)),
	write("Znajomy "), write(X), write(" jest dodany do bazy.").

process_command(del) :-
    writeln("Podaj imię znajomego, którego chcesz usunąć: "),
    read(X),
    retractall(jest_znajomym(X)),
	write("Znajomy "), write(X), write(" został usunięty z bazy.").

process_command(list) :-
    writeln("Lista znajomych: "),
    jest_znajomym(X), writeln(X), fail.
process_command(list).

process_command(exit) :-
    fail.









