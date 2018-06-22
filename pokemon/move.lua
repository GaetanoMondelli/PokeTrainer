local Move = {}

Move = class(function(move, move_id, pp, pp_max)
    move.id = move_id
    move.pp = pp
    move.pp_max = pp_max
end)

return Move
