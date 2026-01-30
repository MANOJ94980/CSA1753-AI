% towers_of_hanoi(NumberOfDisks, Source, Destination, Auxiliary)

hanoi(1, From, To, _) :-
    write('Move disk from '), write(From),
    write(' to '), write(To), nl.

hanoi(N, From, To, Aux) :-
    N > 1,
    hanoi(N-1, From, Aux, To),
    write('Move disk from '), write(From),
    write(' to '), write(To), nl,
    hanoi(N-1, Aux, To, From).
