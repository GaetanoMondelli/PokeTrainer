local move_module = require "pokemon.Move"

Pokemon = {}

function Pokemon:new()
    local self = {
        id,
        hp,
        max_hp,
        attack,
        defense,
        speed,
        special,
    }
    return self
end
