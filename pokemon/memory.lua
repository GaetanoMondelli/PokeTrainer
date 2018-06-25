function readbyte(address)
    return memory.readbyte(address)
end

function readword(address)
    return memory.readbyte(address) + memory.readbyte(address+1)
end
