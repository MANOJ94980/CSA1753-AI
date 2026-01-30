% Facts: birds that can fly
can_fly(sparrow).
can_fly(pigeon).
can_fly(eagle).

% Facts: birds that cannot fly
cannot_fly(ostrich).
cannot_fly(penguin).
cannot_fly(emu).

% Rule to check flying ability
fly(Bird) :- can_fly(Bird).
fly(Bird) :- cannot_fly(Bird), write('This bird cannot fly'), fail.
