local pokemon_module = require "pokemon.Pokemon"
local game_manager_module = require "pokemon.game_manager"
local my_pokemon = Pokemon:new('gaetano')
local opponent_pokemon = Pokemon:new('opponent')
local game_manager = GameManager:new() 

my_pokemon:set_stat('attack' ,  2, 0xD025)
my_pokemon:set_stat('defense',  2, 0xD027)
my_pokemon:set_stat('speed'  ,  2, 0xD029)
my_pokemon:set_stat('special',  2, 0xD02B)
my_pokemon:set_stat('hp'     ,  2, 0xD015)
my_pokemon:set_stat('max_hp' ,  2, 0xD023)
my_pokemon:set_stat('pokeid',   2, 0xCFE5)
my_pokemon:set_stat('move',     2, 0xCCDC)
my_pokemon:set_stat('type1',    1, 0xD019)
my_pokemon:set_stat('type2',    1, 0xD01A)

game_manager:set_turn(0xCCD5)
game_manager:set_battle(0xD057)
game_manager:set_critical(0xD05E)
game_manager:set_miss(0xD05F)

opponent_pokemon:set_stat('attack',  2, 0xCFF6)
opponent_pokemon:set_stat('defense', 2, 0xCFF8)
opponent_pokemon:set_stat('speed',   2, 0xCFFA)
opponent_pokemon:set_stat('special', 2, 0xCFFC)
opponent_pokemon:set_stat('max_hp',  2, 0xCFF4)
opponent_pokemon:set_stat('hp',      2, 0xCFE6)
opponent_pokemon:set_stat('pokeid',  2, 0xD014)
opponent_pokemon:set_stat('move',    2, 0xCCF1)
opponent_pokemon:set_stat('type1',   1, 0xCFEA)
opponent_pokemon:set_stat('type2',   1, 0xCFEB)

while true do
    poo_next_move = readbyte(0xD057)
    game_manager:update()
    opponent_pokemon:update()
    my_pokemon:update()
    gui.text(0,40,"pokeid :char uses" ..poo_next_move, "white")
    emu.frameadvance()
end
