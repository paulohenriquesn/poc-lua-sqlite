local PlayerService = {}
local PlayerRepository = require("sys/lua/src/infra/repositories/player")
local json = require("sys/lua/libs/json")

function PlayerService:onConnect(playerId)
    local playerUsgn = player(playerId, 'usgn')
    if playerUsgn > 0 then
        local playerEntity = PlayerRepository:findOne(playerUsgn)
        msg(json.encode(playerEntity))
    else
        parse(playerId, 'Porfavor se conecte a uma USGN!')
    end
end

function PlayerService:onKill(playerId)
    local playerUsgn = player(playerId, 'usgn')
    PlayerRepository:incrementKills(playerUsgn)
end

function PlayerService:onDie(playerId)
    local playerUsgn = player(playerId, 'usgn')
    PlayerRepository:incrementDeaths(playerUsgn)
end

return PlayerService
