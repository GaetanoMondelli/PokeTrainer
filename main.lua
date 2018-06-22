local pokemon_libray = require "pokemon.Pokemon"

local my_pokemon = Pokemon:new()

my_pokemon.attack   =   memory.readbyte(0x0D026) + memory.readbyte(0x0D027)
my_pokemon.defense  =   memory.readbyte(0x0D028) + memory.readbyte(0x0D029)
my_pokemon.speed    =   memory.readbyte(0x0D02A) + memory.readbyte(0x0D02B)
my_pokemon.special  =   memory.readbyte(0x0D02C)
my_pokemon.hp       =   memory.readbyte(0x0CFE7)
my_pokemon.max_hp   =   memory.readbyte(0x0CFF4) + memory.readbyte(0x0CFF5)


while true do
    gui.text(0,40,"Attack is "..my_pokemon.attack, "white")
    emu.frameadvance()
end