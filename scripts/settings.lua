local M = {}
local saver = require("saver.saver")

M.save_name = "settings"
M.data = {
    music_volume = 0.5,
    sounds_volume = 0.5
}

function M:load()
    saver.bind_save_state("settings", self.data)

    self:set_music_gain()
    self:set_sounds_gain()
end

function M:set_music_gain()
    sound.set_group_gain("music", self.data.music_volume)
end

function M:set_music_volume(value)
    self.data.music_volume = value
    self:set_music_gain()
    saver.save_game_state()
end

function M:set_sounds_gain()
    sound.set_group_gain("effects", self.data.sounds_volume)
end

function M:set_sounds_volume(value)
    self.data.sounds_volume = value
    self:set_sounds_gain()
    saver.save_game_state()
end

function M:set(key, value)
    self.data[key] = value
    saver.save_game_state()
end

return M
