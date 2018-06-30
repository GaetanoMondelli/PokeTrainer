local memory = require "pokemon.Memory"

Pokemon = {}

function Pokemon:new(label)
    local pokemon = {
        name = label,
        value =  {},
        addr = {},
        --to do remove size (all words)
        set_stat = function(self, stat, size, memory_address)
            self.addr[stat] = memory_address    
            self.value[stat] = -1
        end,

        get_stat = function(self, stat)
            if stat == "type1" or stat == "type2" or stat == "move"
            then
                return readbyte(self.addr[stat])
            end
            return readword(self.addr[stat])
        end,

        get_stat_event = function(self, stat, timestamp)
            local file = io.open("poke.log", "a")
            io.output(file)
            old_stat = self.value[stat]  
            new_stat =  self:get_stat(stat)

            if (old_stat ~= new_stat)
            then
                io.write(timestamp..","..self.name..","..stat..","..old_stat..","..new_stat.."\n")
            end
            self.value[stat] = new_stat
            io.close(file)
        end,

        update = function(self, timestamp)
            for k,v in pairs(self.value) do
                self:get_stat_event(k, timestamp)
            end
        end                
    }
    return pokemon
end

 
