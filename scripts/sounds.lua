local M = {}

function M:init()
    self.music = msg.url("/sounds#music")
    self.bear = msg.url("/sounds#bear")
    self.eagle = msg.url("/sounds#eagle")
    self.loot_down = msg.url("/sounds#loot_down")
    self.loot_up = msg.url("/sounds#loot_up")
    self.knife = msg.url("/sounds#knife")
end

function M:play(sound_url, properties)
    sound.play(sound_url, properties)
end

function M:stop(sound_url)
    sound.stop(sound_url)
end

function M:stop_sounds()

end

return M
