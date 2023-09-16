local Player = {}

function Player:create(usgn, level, exp, role, kills, deaths)
    local entity = {
        usgn = usgn,
        level = level,
        exp = exp,
        role = role,
        kills = kills,
        deaths = deaths
    }
    setmetatable(entity, Player)
    return entity
end

return Player