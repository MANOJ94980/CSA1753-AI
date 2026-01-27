from itertools import permutations

def tsp(dist):
    n = len(dist)
    cities = range(n)
    min_cost = float('inf')
    best_path = None

    for path in permutations(cities):
        cost = 0
        for i in range(n - 1):
            cost += dist[path[i]][path[i+1]]
        cost += dist[path[-1]][path[0]]  # return to start

        if cost < min_cost:
            min_cost = cost
            best_path = path

    print("Minimum cost:", min_cost)
    print("Path:", best_path + (best_path[0],))

# Distance matrix
dist = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

tsp(dist)
