% Lab 11 - Name Game

:- dynamic letter/1.

% Initial set of letters
letter(a).
letter(b).
letter(c).


% ---------- Main Menu ----------

menu :-
    nl,
    write('Hi, This is the Name Game'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl, nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice: '),
    read(Choice),
    option(Choice).


% ---------- Options ----------

option(1) :-
    nl,
    write('Current letters:'), nl,
    display_letters,
    menu.

option(2) :-
    write('Enter a letter: '),
    read(X),
    assert(letter(X)),
    write('Letter added.'), nl,
    menu.

option(3) :-
    write('Enter a letter: '),
    read(X),
    asserta(letter(X)),
    write('Letter added at the top.'), nl,
    menu.

option(4) :-
    write('Enter a letter: '),
    read(X),
    assertz(letter(X)),
    write('Letter added at the bottom.'), nl,
    menu.

option(5) :-
    write('Enter a letter to delete: '),
    read(X),
    retract(letter(X)),
    write('Letter deleted.'), nl,
    menu.

option(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

option(7) :-
    write('Exit.'), nl.


% ---------- Display all letters ----------

display_letters :-
    letter(X),
    writeln(X),
    fail.

display_letters.