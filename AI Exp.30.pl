:- dynamic yes/1, no/1.

run :-
    retractall(yes(_)), retractall(no(_)),
    goal(G),
    write('Goal achieved: '), write(G), nl.

ask(Q) :- yes(Q), !.
ask(Q) :- no(Q), !, fail.
ask(Q) :-
    write(Q), write('? (yes/no): '),
    read(A),
    ( A == yes -> assertz(yes(Q)) ; assertz(no(Q)), fail ).

goal(carry_umbrella) :- ask(raining).
goal(wear_jacket)   :- ask(cold).
goal(stay_indoors)  :- ask(raining), ask(windy).
