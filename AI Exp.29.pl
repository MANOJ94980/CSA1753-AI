:- dynamic fact/1.

run :-
    retractall(fact(_)),
    ask(raining), ask(windy), ask(cold),
    rule(A), write(A), nl, fail.
run.

ask(F) :-
    write(F), write('? (yes/no): '),
    read(X),
    ( X == yes -> assertz(fact(F)) ; true ).

rule(carry_umbrella) :- fact(raining).
rule(wear_jacket)   :- fact(cold).
rule(stay_indoors)  :- fact(raining), fact(windy).
