edge(0,1,3).
edge(0,2,6).
edge(0,3,5).
edge(1,4,9).
edge(3,8,7).
edge(8,9,5).

connect(X,Y,C) :- edge(X,Y,C).
connect(X,Y,C) :- edge(Y,X,C).

best_first(Start, Goal) :-
    search([(0,Start)], [], Goal).

search([(Cost,Goal)|_], _, Goal) :-
    write(Goal), nl,
    write('Reached with cost '), write(Cost).

search([(Cost,Node)|Rest], Visited, Goal) :-
    \+ member(Node, Visited),
    write(Node), write(' -> '),
    findall((C,Child),
            ( connect(Node,Child,C),
              \+ member(Child,Visited)
            ),
            Children),
    append(Rest, Children, Queue),
    sort(Queue, Sorted),
    search(Sorted, [Node|Visited], Goal).
