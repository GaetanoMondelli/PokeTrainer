local memory = require "pokemon.Memory"

GameManager = {}

function GameManager:new(bid)
    local gmanager = {
        battle_addr, turn_addr,
        battle=-1,
        turn=-1,

        set_turn = function(self, memory_address)
            self.turn_addr = memory_address              
        end,

        get_turn = function(self)
            return readbyte(self.turn_addr)
        end,

        set_battle = function(self, memory_address)
            self.battle_addr = memory_address              
        end,

        get_battle = function(self)
            return readbyte(self.battle_addr)
        end,
   
        update = function(self)
            local file = io.open("poke.log", "a")
            io.output(file)
            old_battle = self.battle
            old_turn = self.turn
            
            new_battle =  self:get_battle()
            new_turn =  self:get_turn()

            if (old_battle ~= new_battle) 
            then
                io.write("game,battle,"..old_battle..","..new_battle.."\n")
            end
            
            if (old_turn ~= new_turn) 
            then
                io.write("game,turn,"..old_turn..","..new_turn.."\n")               
            end

            self.battle = new_battle
            self.turn = new_turn

            io.close(file)
        end,

    }
    return gmanager
end

 
