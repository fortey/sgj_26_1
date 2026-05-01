local M = {}

M.key = "eagle"
M.urls = { msg.url("level:/player/eagle"),
    msg.url("level:/player/eagle_body"),
    msg.url("level:/player/eagle_arm_l"),
    msg.url("level:/player/eagle_arm_r"),
    msg.url("level:/player/eagle_leg_l"),
    msg.url("level:/player/eagle_leg_r")
}
M.idle = { key = "eagle_idle", opts = { is_loop = true } }
M.run = { key = "eagle_idle", opts = { is_loop = true } }
M.time = 10

function M:enter(player)
    -- player.move.y = 2
    -- player.min_y = 2
    -- player.in_flight = true
end

return M
