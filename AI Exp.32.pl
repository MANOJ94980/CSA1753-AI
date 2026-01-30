match([], []).
match([H|T1], [H|T2]) :-
    match(T1, T2).
