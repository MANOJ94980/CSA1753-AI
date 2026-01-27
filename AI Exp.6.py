# Vacuum Cleaner Problem

def vacuum_cleaner(room_status, position):
    print("Initial State:", room_status, "Vacuum at", position)

    if room_status[position] == "Dirty":
        print("Cleaning", position)
        room_status[position] = "Clean"

    next_room = "B" if position == "A" else "A"
    print("Moving to", next_room)

    if room_status[next_room] == "Dirty":
        print("Cleaning", next_room)
        room_status[next_room] = "Clean"

    print("Final State:", room_status)

# Initial condition
rooms = {"A": "Dirty", "B": "Dirty"}
vacuum_cleaner(rooms, "A")
