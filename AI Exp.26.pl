% Facts (Initial Knowledge Base)

fact(fever).
fact(cough).
fact(chills).

% Rules

rule(flu) :-
    fact(fever),
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, green).
fruit_color(orange, orange).
fruit_color(mango, yellow).
fruit_color(strawberry, red).
    fact(cough).

rule(malaria) :-
    fact(fever),
    fact(chills).

rule(cold) :-
    fact(cough).

% Forward Chaining Inference


forward_chain :-
    rule(Disease),
    write('Inferred Disease: '),
    write(Disease),
    nl,
    fail.

forward_chain.
