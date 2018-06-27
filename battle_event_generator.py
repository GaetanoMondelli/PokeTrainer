trainer = 'gaetano'

with open('poke.log') as f:
    events = f.readlines()

events = [(x[:-1]).split(',') for x in events] 

my_pokemon = {}
opponent = {}
move = -1

snapshot_sender {}
snapshot_receiver = {}

for event in events:
    if event[0] == trainer:
        my_pokemon[event[1]] = event[3]
    if event[0] == trainer:
        opponent[event[1]] = event[3]
    if event[0] == trainer and event[1] == 'move':
        snapshot_sender = my_pokemon
    else:
        snapshot_sender = opponent
            







            
    
