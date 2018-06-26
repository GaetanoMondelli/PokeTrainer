local pokemon_module = require "pokemon.Pokemon"
local my_pokemon = Pokemon:new('gaetano')
local opponent_pokemon = Pokemon:new('opponent')

my_pokemon:set_stat('attack' ,  2, 0xD025)
my_pokemon:set_stat('defense',  2, 0xD027)
my_pokemon:set_stat('speed'  ,  2, 0xD029)
my_pokemon:set_stat('special',  2, 0xD02B)
my_pokemon:set_stat('hp'     ,  2, 0xD015)
my_pokemon:set_stat('max_hp' ,  2, 0xD023)
my_pokemon:set_stat('pokeid',   2, 0xCFE5)
my_pokemon:set_stat('move',     2, 0xCCDC)
my_pokemon:set_stat('critical', 2, 0xD05E)
my_pokemon:set_stat('miss',     2, 0xD05F)
my_pokemon:set_stat('turn',     2, 0xCCD5)

opponent_pokemon:set_stat('attack',  2, 0xCFF6)
opponent_pokemon:set_stat('defense', 2, 0xCFF8)
opponent_pokemon:set_stat('speed',   2, 0xCFFA)
opponent_pokemon:set_stat('special', 2, 0xCFFC)
opponent_pokemon:set_stat('max_hp',  2, 0xCFF4)
opponent_pokemon:set_stat('hp',      2, 0xCFE6)
my_pokemon:set_stat('pokeid',        2, 0xD014)
opponent_pokemon:set_stat('move',    2, 0xCFCC)

while true do
    turn = readword(0x0CD5)
    poo_next_move = readword(0x0FCC)
    my_move = readbyte(0xCCF1)
    --opponent_pokemon:update()
    my_pokemon:update()
    gui.text(0,40,"pokeid :char uses" ..opponent_pokemon:get_stat('hp'), "white")
    emu.frameadvance()
end
