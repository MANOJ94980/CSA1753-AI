from collections import deque

# Goal state
goal_state = ((1, 2, 3),
              (4, 5, 6),
              (7, 8, 0))

# Possible moves: up, down, left, right
moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]

def find_zero(state):
    for i in range(3):
        for j in range(3):
            if state[i][j] == 0:
                return i, j

def bfs(start_state):
    queue = deque()
    queue.append((start_state, []))
    visited = set()
    visited.add(start_state)

    while queue:
        current, path = queue.popleft()

        if current == goal_state:
            return path

        x, y = find_zero(current)

        for dx, dy in moves:
            nx, ny = x + dx, y + dy

            if 0 <= nx < 3 and 0 <= ny < 3:
                new_state = [list(row) for row in current]
                new_state[x][y], new_state[nx][ny] = new_state[nx][ny], new_state[x][y]
                new_state = tuple(tuple(row) for row in new_state)

                if new_state not in visited:
                    visited.add(new_state)
                    queue.append((new_state, path + [new_state]))

    return None

# Initial state
start_state = ((1, 2, 3),
               (4, 0, 6),
               (7, 5, 8))

solution = bfs(start_state)

print("Steps to solve 8-Puzzle:")
for step in solution:
    for row in step:
        print(row)
    print()
