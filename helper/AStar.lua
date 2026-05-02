local M = {}
M.tile_size = 10
local initialized = false
local offset = vmath.vector3()

function M.screen_to_coords(x, y)
	local result = vmath.vector3(math.ceil(x/M.tile_size) - offset.x + 1, 0, math.ceil(y/M.tile_size) - offset.z + 1)
	return result
end

function M.screen_to_tilemap_coords(x, y)
	local result = vmath.vector3(math.ceil(x/M.tile_size), 0, math.ceil(y/M.tile_size))
	return result
end

function M.free_tile(x, y)
	print("free " .. x .. " " .. y .. " " .. astar.get_at(x, y))
	astar.set_at(x, y, astar.get_at(x, y) - 1)
end

function M.set_tile_to_enemy(x, y)
	print("set enemy to " .. x .. " " .. y .. " " .. astar.get_at(x, y))
	astar.set_at(x, y, astar.get_at(x, y) + 1)

	astar.set_entities({ 2 })
	astar.use_entities(true)
end

function M.coords_to_screen(x, y)
	local result = vmath.vector3(x, 0, y) + offset - vmath.vector3(2, 0, 2)
	return vmath.vector3(result.x * M.tile_size + M.tile_size/2, 0, result.z * M.tile_size + M.tile_size/2)
end

function M.setup_astar(map_width, map_height, tilemap_path, layer, map_offset)
	local map = {}
	local tiles = tilemap.get_tiles(tilemap_path, layer)
	offset = map_offset
	for z = offset.z, map_height + offset.z - 1 do
		for x = offset.x, map_width + offset.x - 1 do
			local tile = tiles[z][x]			
			if (tile == 201) then
				table.insert(map, 1)  -- Walkable
			else
				table.insert(map, 0)  -- Non-walkable
			end
		end
	end
	
	-- A* configuration
	local direction = astar.DIRECTION_EIGHT
	local allocate = map_width * map_height
	local typical_adjacent = 8
	local cache = true
	local use_zero = false
	local flip_map = false
	
	astar.setup(map_width, map_height, direction, allocate, typical_adjacent, cache, use_zero, flip_map)
	astar.set_map(map)

	astar.set_entities({ 2 })
	astar.use_entities(true)

	local costs = {
		[1] = {
			1.0,  -- E
			1.0,  -- N
			1.0,  -- W
			1.0,  -- S
			1.41, -- NE
			1.41, -- NW
			1.41, -- SW
			1.41  -- SE
		},
	}
	astar.set_costs(costs)
	initialized = true
end

function M.find_path(start_position, end_position, is_map_coordinates_passed)
	if not initialized then
		print("NO_SOLUTION")
		return nil, 0
	end
	if not is_map_coordinates_passed then
		start_position = M.screen_to_coords(start_position.x, start_position.z)
		end_position = M.screen_to_coords(end_position.x, end_position.z)
	end
	--print(start_position.x .. " " .. start_position.z .. " | " .. end_position.x .. " " .. end_position.z)
	local status, _, total_cost, path = astar.solve(start_position.x, start_position.z, end_position.x, end_position.z)

	if status == astar.SOLVED then
		--print("PATH FINDED")
		local waypoints = {}
		for _, tile in ipairs(path) do
			table.insert(waypoints, {x = tile.x, y = tile.y})
		end
		return waypoints, total_cost
	elseif status == astar.NO_SOLUTION then
		--print("NO_SOLUTION")
	elseif status == astar.START_END_SAME then
		--print("START_END_SAME")
	end
	return nil, 0
end

return M
