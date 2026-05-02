local M = {}

local RAY_COUNT = 10
local RAY_LENGTH = 10
local RAY_SPREAD = 80
local SEPARATION_RADIUS = 50


local function get_obstacle_avoidance(position, direction)
	local avoidance = vmath.vector3(0, 0, 0)
	local half_spread = math.rad(RAY_SPREAD / 2)
	local angle_step  = math.rad(RAY_SPREAD / (RAY_COUNT - 1))
	local base_angle = math.atan2(direction.x, direction.z)

	for i = 0, RAY_COUNT - 1 do
		local angle  = base_angle - half_spread + angle_step * i
		local ray_dir = vmath.vector3(math.sin(angle), 0, math.cos(angle))
		local ray_end = position + ray_dir * RAY_LENGTH

		local result = physics.raycast(position, ray_end, { hash("default"), hash("enemy") })
		if result then
			local hit_distance = result.fraction * RAY_LENGTH
			local strength = 1.0 - (hit_distance / RAY_LENGTH)

			local perpendicular = vmath.vector3(-ray_dir.z, 0, ray_dir.x)

			local center_weight = 1.0 - math.abs(i - (RAY_COUNT - 1) / 2) / (RAY_COUNT - 1)
			avoidance = avoidance + perpendicular * strength * (1.0 + center_weight)
		end
	end

	return avoidance
end

local function get_separation(self_position, self_id, nearest_enemies)
	local separation = vmath.vector3(0, 0, 0)

	if not nearest_enemies or #nearest_enemies == 0 then return separation end

	for _, enemy_id in ipairs(nearest_enemies) do
		if go.exists(enemy_id) then
			local other_pos = go.get_position(enemy_id)
			local delta = self_position - other_pos
			delta.y = 0
			local distance = vmath.length(delta)

			if distance > 0 and distance < SEPARATION_RADIUS then
				local strength = 1.0 - (distance / SEPARATION_RADIUS)
				separation = separation + vmath.normalize(delta) * strength
			end
		end
	end

	return separation
end

function M.get_steering_direction(self_id, position, desired_direction, nearest_enemies)
	if vmath.length(desired_direction) < 0.001 then
		return desired_direction
	end

	local avoidance = get_obstacle_avoidance(position, desired_direction)
	local separation = get_separation(position, self_id, nearest_enemies)

	local steering = desired_direction + avoidance + separation

	if vmath.length(steering) > 0.001 then
		return vmath.normalize(steering)
	end

	return desired_direction
end

return M