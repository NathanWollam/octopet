-- world

function spawn_octopet()
  local number_of_legs = 8
  local symmetry_offset = 1/16
  local distance_between_angles = 1/number_of_legs
  for i=0, number_of_legs-1 do
    local leg_angle = i*distance_between_angles + symmetry_offset
    local sine_of_leg_angle = sin(leg_angle) * 6
    local cosine_of_leg_angle = cos(leg_angle) * 6
    add(world_pet.legs, {
      x=(world_pet.x+4) + sine_of_leg_angle,
      y=(world_pet.y+4) + cosine_of_leg_angle,
      d=2,
      c=9
    })
  end
end


function spawn_pkups_rand(sprite, amount, width, height)
  for pkup=0,amount do
    x_offset= 0
    y_offset= info_bar_h+1
    x_range = flr(rnd(world_w-width))
    y_range = flr(rnd(world_h)+y_offset)
    if (x_range > world_w/2) x_range+=1
    if (y_range > world_h/2) y_range+=1
    if (y_range >= world_h-height) y_range-= y_offset+height+1
    add(world_pkups,{s=sprite,x=x_range,y=y_range,h=height,w=width})
  end
end

function update_legs(x_change, y_change)
  local updated_legs = {}
  for leg in all(world_pet.legs) do
    leg.x+=x_change
    leg.y+=y_change
    add(updated_legs, leg)
  end
  return updated_legs
end

function get_collisions()
  collisions = {}
  for p in all(world_pkups) do
    c_detected = circ_rect_intersect(p)
    if (c_detected) add(collisions, p)
  end
  -- if (collisions[1]) printh(#collisions)
  return collisions
end

function circ_rect_intersect(p)
  local r = stats[3].level
  circ_dis_x = abs(world_pet.x-p.x)
  circ_dis_y = abs(world_pet.y-p.y)

  if (circ_dis_x > p.w/2+r) or
     (circ_dis_y > p.h/2+r) then
     return false
  end

  if (circ_dis_x <= (p.w/2)) or
     (circ_dis_y <= (p.h/2)) then
     del(world_pkups,p)
     return true
  end

  corner_dis_sq =
    (circ_dis_x-p.w/2)^2 +
    (circ_dis_y-p.h)^2

  if (corner_dis_sq <= r^2) then
    del(world_pkups,p)
    return true
  end
end
