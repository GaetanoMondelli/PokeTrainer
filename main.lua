local pokemon_module = require "pokemon.Pokemon"

local my_pokemon = Pokemon:new()
local opponent_pokemon = Pokemon:new()

my_pokemon:set_stat('attack' , 2, 0x0D025)
my_pokemon:set_stat('defense', 2, 0x0D027)
my_pokemon:set_stat('speed'  , 2, 0x0D029)
my_pokemon:set_stat('special', 2, 0x0D02B)
my_pokemon:set_stat('hp'     , 2, 0x0D015)
my_pokemon:set_stat('max_hp' , 2, 0x0D023)

opponent_pokemon:set_stat('attack',  2, 0xCFF6)
opponent_pokemon:set_stat('defense', 2, 0xCFF8)
opponent_pokemon:set_stat('speed',   2, 0xCFFA)
opponent_pokemon:set_stat('special', 2, 0xCFFC)
opponent_pokemon:set_stat('max_hp',  2, 0xCFF4)
opponent_pokemon:set_stat('last_move',  2, 0xCFCC)

opponent_pokemon:set_stat('hp', 2, 0xCFE6)

--cfe5 cfd8 ccd5
--ccdd ccf2 cfcc
--event sourcing 
while true do
    turn = readword(0x0CD5)
    poo_next_move = readword(0x0FCC)
    my_move = readbyte(0xCCF1)
    opponent_pokemon:update()
    gui.text(0,40,"pokeid :char uses" ..opponent_pokemon:get_stat('hp'), "white")
    emu.frameadvance()
end
