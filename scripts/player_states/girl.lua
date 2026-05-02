local M = {}

M.key = "girl"
M.urls = { msg.url("level:/player/girl"),
    msg.url("level:/player/body"),
    msg.url("level:/player/arm_l"),
    msg.url("level:/player/arm_r"),
    msg.url("level:/player/leg_l"),
    msg.url("level:/player/leg_r"),
    msg.url("level:/player/head"),
    msg.url("level:/player/pero"),
    msg.url("level", "/player/player", "co"),
    M.attack_trigger
}
M.idle = { key = "idle", opts = { is_loop = true } }
M.run = { key = "run", opts = { is_loop = true } }
M.attack = { key = "attack" }
M.attack_vfx = "vfx_knife"
M.attack_time = 0.5
M.attack_damage = 1
M.attack_trigger = msg.url("level:/player/player#girl_attack_trigger")
M.speed = 0.45

return M
