local M = {}

function M:init()
    
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
