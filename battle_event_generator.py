trainer_name = 'gaetano'
opponent_name = 'opponent'
manager_name = 'game'

with open('poke.log') as f:
    events = f.readlines()

events = [(x[:-1]).split(',') for x in events] 

my_pokemon = {}
opponent = {}
manager = {}

battle_active = False

active = None
passive = None

def bind_event(event):
    if event[0] == trainer_name:
        my_pokemon[event[1]] = event[3]
    if event[0] == opponent_name:
        opponent[event[1]] = event[3]
    if event[0] == manager_name:
        manager[event[1]] = event[3]

def print_pokemon(pokemon):
    pass



for event in events:
    ''' 
    TODO: This transition can define
          who has performed the attack

        if my_pokemon['speed'] > opponent['speed']:
            battle,128,x   gaetano
            battle,100,x   gaetano
        else
            battle,164,x   opponent
            battle, 78,x   opponent
    '''
    bind_event(event)
    battle_active = ('battle' in manager and int(manager['battle']) > 0)
    
    #if battle_active and event[1] == 'turn':
    #   print(event[3])
    #   print('my ',my_pokemon)
    #   print('op ',opponent)

    if battle_active and event[1] == 'move': #and int(manager['turn']) > 0:
        #print(event[3])
        #if event[0] == opponent_name:
        #    active = 
        print(manager['turn'])
        print('my ',my_pokemon)
        print('op ',opponent)
        print (event[0] +' uses'+ event[3])
        print('----------------------')









            
    
