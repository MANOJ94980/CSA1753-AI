:- dynamic yes/1, no/1.

% Ask symptom only once
ask(S) :- yes(S), !.
ask(S) :- no(S), !, fail.
ask(S) :-
    write('Do you have '), write(S), write('? (yes/no): '),
    read(A),
    ( A == yes -> assertz(yes(S)) ; assertz(no(S)), fail ).

% Disease rules
disease(flu) :-
    ask(fever),
    ask(cough).

disease(cold) :-
    ask(cough),
    ask(sneezing).

disease(malaria) :-
    ask(fever),
    ask(chills).

% Main diagnosis (CUT stops backtracking)
diagnosis :-
    disease(D),
    write('Diagnosed Disease: '), write(D), nl,
    !.

diagnosis :-
    write('No disease diagnosed.'), nl.

% Clear memory
clear :-
    retractall(yes(_)),
    retractall(no(_)).
