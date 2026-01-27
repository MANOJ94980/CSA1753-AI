import heapq

def astar(graph, h, start, goal):
    open_list = [(h[start], 0, start, [])]
    visited = set()

    while open_list:
        f, g, node, path = heapq.heappop(open_list)

        if node in visited:
            continue
        visited.add(node)
        path = path + [node]

        if node == goal:
            return path, g

        for next_node, cost in graph[node]:
            if next_node not in visited:
                heapq.heappush(
                    open_list,
                    (g + cost + h[next_node], g + cost, next_node, path)
                )

# Graph (node : [(neighbor, cost)])
graph = {
    'A': [('B', 1), ('C', 3)],
    'B': [('D', 1), ('E', 5)],
    'C': [('F', 2)],
    'D': [],
    'E': [('F', 1)],
    'F': []
}

# Heuristic values
heuristic = {
    'A': 5,
    'B': 4,
    'C': 3,
    'D': 2,
    'E': 1,
    'F': 0
}

path, cost = astar(graph, heuristic, 'A', 'F')
print("Path:", path)
print("Cost:", cost)
