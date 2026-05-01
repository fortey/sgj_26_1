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
}
M.idle = "idle"
M.run = "run"
M.attack = "attack"

return M
