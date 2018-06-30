local memory = require "pokemon.Memory"

GameManager = {}

function GameManager:new(bid)
    local gmanager = {
        battle_addr, turn_addr, miss_addr, critical_addr, oppturn_addr, battle_turn_addr,
        battle = -1,
        turn = -1,
        critical = -1,
        miss = -1,
        oppturn = -1,
        battle_turn = -1,

        set_battle_turn = function(self, memory_address)
            self.battle_turn_addr = memory_address
        end,

        get_battle_turn = function(self)
            return readbyte(self.battle_turn_addr)
        end,

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

        set_miss = function(self, memory_address)
            self.miss_addr = memory_address
        end,

        get_miss = function(self, memory_address)
            return readbyte(self.miss_addr)
        end,

        set_critical = function(self, memory_address)
            self.critical_addr = memory_address
        end,

        get_critical = function(self, memory_address)
            return readbyte(self.critical)
        end,

        set_oppturn = function(self, memory_address)
            self.oppturn_addr = memory_address
        end,

        get_oppturn = function(self, memory_address)
            return readbyte(self.oppturn_addr)
        end,
   
        update = function(self, timestamp)
            local file = io.open("poke.log", "a")
            io.output(file)
            old_battle = self.battle
            old_turn = self.turn
            old_oppturn = self.oppturn
            old_battle_turn = self.battle_turn
            
            new_battle =  self:get_battle()
            new_turn =  self:get_turn()
            new_oppturn =  self:get_oppturn()  
            new_battle_turn = self:get_battle_turn()
            
            if (old_battle_turn ~= new_battle_turn)
            then
                if (old_battle_turn == 128 or old_battle_turn == 100)
                then
                    io.write(timestamp..",game,gaetano,move,finished\n")
                end

                if (old_battle_turn == 164 or old_battle_turn == 78)
                then
                    io.write(timestamp..",game,opponent,move,finished\n")
                end
                
                if (new_battle_turn == 128 or new_battle_turn == 100)
                then
                    io.write(timestamp..",game, gaetano, move, started\n")
                end

                if (new_battle_turn == 164 or new_battle_turn == 78)
                then
                    io.write(timestamp..",game, opponent, move, started\n")
                end
            end 

            if (old_battle ~= new_battle) 
            then
                io.write(timestamp..",game,battle,"..old_battle..","..new_battle.."\n")
            end
            
            if (old_turn ~= new_turn) 
            then
                io.write(timestamp..",game,turn,"..old_turn..","..new_turn.."\n")               
            end

            if (old_oppturn ~= new_oppturn) 
            then
                io.write(timestamp..",game,opturn,"..old_oppturn..","..new_oppturn.."\n")               
            end

            self.battle_turn = new_battle_turn
            self.battle = new_battle
            self.turn = new_turn
            self.oppturn = new_oppturn

            io.close(file)
        end,

    }
    return gmanager
end

 
