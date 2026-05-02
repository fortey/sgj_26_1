local M       = {}
local sounds  = require("scripts.sounds")

M.key         = "bear"
M.urls        = { msg.url("level:/player/bear"),
    msg.url("level:/player/bear_body"),
    msg.url("level:/player/bear_arm_l"),
    msg.url("level:/player/bear_arm_r"),
    msg.url("level:/player/bear_head"),
    msg.url("level:/player/bear_leg_l"),
    msg.url("level:/player/bear_leg_r"),
    msg.url("level", "/player/player", "co_bear"),
}
M.idle        = { key = "bear_idle", opts = { is_loop = true } }
M.run         = { key = "bear_run", opts = { is_loop = true } }
M.attack      = { key = "bear_attack" }
M.attack_vfx  = "empty"
M.attack_time = 0.5
M.time        = 10
M.cooldown    = 20
M.speed       = 0.30

function M:enter(player)
    sounds:play(sounds.bear)
end

return M
