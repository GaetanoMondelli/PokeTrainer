local move_module = require "pokemon.Move"
local memory = require "pokemon.Memory"

Pokemon = {}

function Pokemon:new(label)
    local pokemon = {
        name = label,
        value =  {},
        addr = {},

        set_stat = function(self, stat, size, memory_address)
            self.addr[stat] = memory_address
            if (size == 1)
            then
                self.value[stat] = readbyte(self.addr[stat])
            else
                self.value[stat] = readword(self.addr[stat])
            end                 
        end,

        get_stat = function(self, stat)
            return readword(self.addr[stat])
        end,

        get_stat_event = function(self, stat)
            local file = io.open("poke.log", "a")
            io.output(file)
            old_stat = self.value[stat]  
            new_stat =  self:get_stat(stat)

            if (old_stat ~= new_stat) --or new battle id
            then
                io.write(self.name..","..stat..","..old_stat..","..new_stat.."\n")
            end
            self.value[stat] = new_stat
            io.close(file)
        end,

        update = function(self)
            for k,v in pairs(self.value) do
                self:get_stat_event(k)
            end
        end                

    }
    return pokemon
end

 
