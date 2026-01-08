from collections import deque

# State: (Missionaries_left, Cannibals_left, Boat_position)
# Boat_position: 0 = left bank, 1 = right bank

def is_valid(state):
    m, c, b = state
    # Invalid if out of bounds
    if m < 0 or c < 0 or m > 3 or c > 3:
        return False

    # Missionaries should not be outnumbered
    if (m > 0 and m < c):
        return False
    if (3 - m > 0 and 3 - m < 3 - c):
        return False

    return True


def get_successors(state):
    successors = []
    m, c, b = state

    moves = [(2,0), (0,2), (1,1), (1,0), (0,1)]

    for m_move, c_move in moves:
        if b == 0:  # Boat on left
            new_state = (m - m_move, c - c_move, 1)
        else:       # Boat on right
            new_state = (m + m_move, c + c_move, 0)

        if is_valid(new_state):
            successors.append(new_state)

    return successors


def bfs():
    start = (3, 3, 0)
    goal = (0, 0, 1)

    queue = deque([(start, [start])])
    visited = set()

    while queue:
        state, path = queue.popleft()

        if state == goal:
            return path

        if state not in visited:
            visited.add(state)
            for successor in get_successors(state):
                queue.append((successor, path + [successor]))

    return None


# Run the solution
solution = bfs()

if solution:
    print("Solution Steps:")
    for step in solution:
        print(step)
else:
    print("No solution found")
