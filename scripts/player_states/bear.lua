local M = {}

M.key = "bear"
M.urls = { msg.url("level:/player/bear"),
    msg.url("level:/player/bear_body"),
    msg.url("level:/player/bear_arm_l"),
    msg.url("level:/player/bear_arm_r"),
    msg.url("level:/player/bear_head"),
    msg.url("level:/player/bear_leg_l"),
    msg.url("level:/player/bear_leg_r")
}
M.idle = "bear_idle"
M.run = "bear_run"

return M
