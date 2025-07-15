-- world

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
