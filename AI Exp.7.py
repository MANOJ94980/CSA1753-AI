from collections import deque

def bfs(graph, start):
    visited = set()
    queue = deque([start])

    while queue:
        v = queue.popleft()
        if v not in visited:
            print(v, end=" ")
            visited.add(v)
            queue.extend(graph[v])

# Graph representation
graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': [],
    'F': []
}

bfs(graph, 'A')
