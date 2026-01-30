% Facts: parent relationships
parent(john, mary).
parent(john, tom).
parent(susan, mary).
parent(susan, tom).

parent(tom, anna).
parent(tom, peter).

% Facts: gender
male(john).
male(tom).
male(peter).

female(susan).
female(mary).
female(anna).

% Rules
father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC).
