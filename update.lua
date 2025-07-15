-- update

function update_debug()
  if btnp(❎) then
    state = "world"
  end
end

function update_main_menu()
  if btnp(❎) then
    manage_save_state("load")
    state = "world"
    spawn_pkups_rand(102,9,8,8)
    spawn_pkups_rand(101,0,8,8)
  end
end

function update_world()
  local face = world_pet.face[world_pet.set_face]

  if btnp(🅾️) then
    state = "stat_menu"
  else
    world_pet.state = face
  end

  if btn(➡️) then
    world_pet.is_left = false
    world_pet.state = face + 1
    world_pet.x += 1
  end

  if btn(⬅️) then
    world_pet.is_left = true
    world_pet.state = face + 1
    world_pet.x -= 1
  end

  if btn(⬇️) then
    world_pet.state = face + 2
    world_pet.y += 1
  end

  if btn(⬆️) then
    world_pet.y -= 1
    -- world_pet.set_face = "frown"
  end

  -- need to have a mapper function
  -- for different collisions
  collisions = get_collisions()
  if (#collisions > 0) then
    clam_count += #collisions
  end

  if world_pet.x > 120 then
    state = "shop"
  elseif world_pet.x < 0 then
    state = "minigames"
  end
end

function update_stat_menu()
  -- octopet animations
  flicker_eye(blink_rate)
  blink(blink_rate)
  sway_pet_midpoint_y(0.15)
  sway_pet_midpoint_x(0.25)
  sway_pet_legs_y(0.15)
  -- navigation
  if btnp(🅾️) then
    state = "world"
  elseif btnp(⬅️) then
    cursor_spr = 4
    cursor_on_pet = true
    stat_pet_startpoint = {x=35,y=56}
    cursor_location = stat_pet_startpoint
  elseif btnp(➡️) then
    cursor_spr = 2
    cursor_on_pet = false
    cursor_location = cursor_stats
  elseif btnp(⬇️) and
   not cursor_on_pet and
   stat_box.stat_index < 3 then
    stat_box.stat_index += 1
  elseif btnp(⬆️) and
   not cursor_on_pet and
   stat_box.stat_index > 0 then
    stat_box.stat_index -= 1
  end

  local off_index = stat_box.stat_index + 1
  -- exp increment logic
  if not cursor_on_pet and
   btnp(❎) and
   stat_box.available_exp > 0 and
   stats[off_index].level < 7 then
    stat_box.available_exp -= 1
    stats[off_index].level += 1
    update_file()
  elseif btnp(❎) then
    sway_pet_startpoint(3)
  end
end

function update_shop()
  if btnp(🅾️) then
    state = "shop_menu"
  elseif btnp(⬅️) then
    state = "world"
  end
end

function update_shop_menu()
  if btnp(🅾️) then
    state = "shop"
  end
end

function update_minigames()
  if btnp(➡️) then
    state = "world"
  end
end
