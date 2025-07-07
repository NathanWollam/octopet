
-- animations

function blink(interval)
  blink_ai += 1
  random_interval = blink_randomness + interval

  if blink_ai > random_interval then
    blink_ai = -blink_open_delay
    blink_randomness = rnd(interval * 0.1)

    blink_state = 1
  elseif blink_state == 1 then
    blink_state = 2
  elseif blink_ai > 0 then
    blink_state = 0
  end
end

function sway_pet_midpoint_x(sway_distance)
  stat_pet_midpoint.x += cos(time()) * sway_distance
end

function sway_pet_startpoint(sway_distance)
  stat_pet_startpoint.x += cos(time()) * sway_distance
end

function sway_pet_midpoint_y(sway_distance)
  stat_pet_midpoint.y += sin(time()) * sway_distance
end

function sway_pet_legs_y(sway_distance)
  stat_pet_leg_offset.y += sin(time()) * sway_distance
end

function flicker_eye(interval)
  pupil_flick_ai += 1
  local index = (pupil_flick_ai/(interval))+1

  if index >= #pupil_script+1 then
    pupil_flick_ai = 0
    blink(0,blink_open_delay)
    stat_pet_pupil_offset.x = 0
    stat_pet_pupil_offset.y = 0
  elseif pupil_flick_ai %
   interval == 0 then
    blink(0,blink_open_delay)
    stat_pet_pupil_offset.x =
     pupil_script[index][1]
    stat_pet_pupil_offset.y =
     pupil_script[index][2]
  end
end
