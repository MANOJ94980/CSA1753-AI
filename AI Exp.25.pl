% --- Actions the monkey can take ---
move(state(middle, onbox, middle, hasnot),
     grasp,
     state(middle, onbox, middle, has)) :-
     writeln('Action: grasp (Monkey takes the banana)').

move(state(P, onfloor, P, H),
     climb,
     state(P, onbox, P, H)) :-
     format('Action: climb onto box at ~w~n', [P]).

move(state(P1, onfloor, P1, H),
     drag(P1, P2),
     state(P2, onfloor, P2, H)) :-
     format('Action: drag box from ~w to ~w~n', [P1, P2]).

move(state(P1, onfloor, B, H),
     walk(P1, P2),
     state(P2, onfloor, B, H)) :-
% --- Actions the monkey can take ---

move(state(middle, onbox, middle, hasnot),
     grasp,
     state(middle, onbox, middle, has)) :-
     writeln('Action: grasp (Monkey takes the banana)').

move(state(P, onfloor, P, H),
     climb,
     state(P, onbox, P, H)) :-
     format('Action: climb onto box at ~w~n', [P]).

move(state(P1, onfloor, P1, H),
     drag(P1, P2),
     state(P2, onfloor, P2, H)) :-
     P1 \= P2,
     format('Action: drag box from ~w to ~w~n', [P1, P2]).

move(state(P1, onfloor, B, H),
     walk(P1, P2),
     state(P2, onfloor, B, H)) :-
     P1 \= P2,
     format('Action: walk from ~w to ~w~n', [P1, P2]).

% --- Goal state ---
canget(state(_, _, _, has), _) :-
    writeln('Goal reached! Monkey has the banana.').

% --- Recursive search with visited list ---
canget(State1, Visited) :-
    move(State1, _, State2),
    \+ member(State2, Visited),
    canget(State2, [State2 | Visited]).
     format('Action: walk from ~w to ~w~n', [P1, P2]).

% --- Recursively find path to the goal with printed actions ---
canget(state(_, _, _, has)) :-
    writeln('Goal reached! Monkey has the banana.').

canget(State1) :-
    move(State1, _, State2),
    canget(State2).
GIVE SAMPLE OUTPUTS
