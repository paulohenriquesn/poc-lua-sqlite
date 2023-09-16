require("sys/lua/libs/sqlite")

local Player = require("sys/lua/src/domain/entities/player")
local db = sqlite3.open("sys/lua/database.db");

local PlayerRepository = {}

function PlayerRepository:incrementKills(usgn)
    do
        db:exec('UPDATE players SET kills = kills + 1 WHERE usgn = '..usgn..'')
    end
end

function PlayerRepository:incrementDeaths(usgn)
    do
        db:exec('UPDATE players SET deaths = deaths + 1 WHERE usgn = '..usgn..'')
    end
end

function PlayerRepository:findOne(usgn)
    local entity = {}

    for player in db:rows('SELECT * FROM players WHERE usgn = '..usgn..'')
    do
       entity = Player:create(player[1], player[2], player[3], player[4], player[5])
    end

    return entity
end

return PlayerRepository
