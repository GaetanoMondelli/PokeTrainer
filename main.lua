local pokemon_module = require "pokemon.Pokemon"

local my_pokemon = Pokemon:new()
local opponent_pokemon = Pokemon:new()

my_pokemon.attack   =   readword(0x0D025)
my_pokemon.defense  =   readword(0x0D027)
my_pokemon.speed    =   readword(0x0D029)
my_pokemon.special  =   readword(0x0D02B)
my_pokemon.hp       =   readword(0x0D015)
my_pokemon.max_hp   =   readword(0x0D023)

----opponent_pokemon.attack   =   readword(0xCFF6)
--opponent_pokemon.defense  =   readword(0xCFF8)
--opponent_pokemon.speed    =   readword(0xCFFA)
--opponent_pokemon.special  =   readword(0xCFFC)
opponent_pokemon:set_stat('hp', 0xCFE6)
--opponent_pokemon.max_hp   =   readword(0xCFF4)
--cfe5 cfd8
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
