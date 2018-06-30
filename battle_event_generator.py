from pprint import pprint
import json

trainer_name = 'gaetano'
opponent_name = 'opponent'
manager_name = 'game'

with open('poke.log') as f:
    raw_events = f.readlines()

raw_events = [(x[:-1]).split(',') for x in raw_events] 
events = []
actions = []
my_pokemon = {}
opponent = {}
manager = {}

battle_active = False

def bind_event(event):
    if event[1] == trainer_name:
        my_pokemon[event[2]] = event[4]
    if event[1] == opponent_name:
        opponent[event[2]] = event[4]
    if event[1] == manager_name:
        manager[event[2]] = event[4]

def get_snapshot(pokemon):
    pokemon_snapshot = '{'    
    pokemon_snapshot += "'attack': '{0}', 'defense':'{1}',".format(pokemon['attack'], pokemon['defense']) 
    pokemon_snapshot += "'hp':'{0}', 'max_hp': '{1}',".format(pokemon['hp'], pokemon['max_hp'])
    pokemon_snapshot += "'pokeid': '{0}', 'special': '{1}', 'speed': '{2}',".format(pokemon['pokeid'], pokemon['special'], pokemon['speed'])
    pokemon_snapshot += "'type1': '{0}', 'type2': '{1}'".format(pokemon['type1'], pokemon['type2'])
    pokemon_snapshot += '}'
    return pokemon_snapshot

def get_action(pokemon, trainer, game_timestamp):
    action = '{'
    action += "'time':'{0}', pokeid':'{1}', move:'{2}', trainer:'{3}'".format(game_timestamp, pokemon['pokeid'], pokemon['move'], trainer)
    action += '}'
    return action


for event in raw_events:
    bind_event(event)
    battle_active = ('battle' in manager and int(manager['battle']) > 0)
    
    if battle_active and event[3] == 'move': #and int(manager['turn']) > 0:
        performer = my_pokemon if event[2] == trainer_name else opponent
        snapshot = {}
        snapshot[trainer_name] = get_snapshot(my_pokemon)
        snapshot[opponent_name] = get_snapshot(opponent)
        events.append(snapshot)
        print(event)        
        if(event[4] == 'finished'):
            action = get_action(performer, event[2], event[0])
            actions.append(action)

print(len(events))
print(len(actions))
battle_events = []
count = 0
for action in actions:
        battle_event = {}
        battle_event['action'] = action
        battle_event['before'] = events[count]
        battle_event['after'] =  events[count+1]
        battle_events.append(battle_event)
        count+=2

pprint(battle_events)

with open('poke_event.log', 'a') as out_file:
    for event in battle_events:
        out_file.write(json.dumps(event, sort_keys=True)+'\n')





            
    
