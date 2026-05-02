local M                = {}
local sounds           = require("scripts.sounds")

M.key                  = "eagle"
M.urls                 = { msg.url("level:/player/eagle"),
    msg.url("level:/player/eagle_body"),
    msg.url("level:/player/eagle_arm_l"),
    msg.url("level:/player/eagle_arm_r"),
    msg.url("level:/player/eagle_leg_l"),
    msg.url("level:/player/eagle_leg_r"),
    msg.url("level", "/player/player", "co_eagle"),
}
M.idle                 = { key = "eagle_idle", opts = { is_loop = true } }
M.run                  = { key = "eagle_idle", opts = { is_loop = true } }
M.time                 = 5
M.ascend_speed         = 0.8
M.flight_height_offset = 20
M.cooldown             = 20
M.speed                = 0.65

function M:enter(player)
    player.flight_target_y = self.flight_height_offset
    player.in_flight = true

    sounds:play(sounds.eagle)
end

function M:exit(player)
    player.in_flight = false
end

return M
