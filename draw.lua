-- draw

function draw_debug()
  cls(0)
  color(text_color)
  print(error)
end

function draw_main_menu()
  cls(9)
  color(text_color_inv)
  print("press ❎ to start", 30, 63)
  print("to restart, select new game ", 10, 100)
  print("in pico-8 menu", 35, 107)
end

function draw_world()
  -- draw background, prepare alpha layer
  cls(12)
  palt(0,false)
  palt(8,true)
  -- draw foreground
  draw_octopet()
  draw_world_pkups()
  -- info bar
  rectfill(0,0,127,info_bar_h,7)
  draw_world_clam_count()
  -- reset alpha and colors
  palt()
  color(text_color_inv)
end

function draw_octopet()
  draw_legs()
  spr(world_pet.state,world_pet.x,world_pet.y,1,1,world_pet.is_left)
end

function draw_legs()
  poke(0x5f36,0x2) -- allows even diameter
  for leg in all(world_pet.legs) do
    circfill(leg.x, leg.y, leg.d/2, leg.c)
  end
end

function draw_world_pkups()
  for p in all(world_pkups) do
    spr(p.s,p.x,p.y)
  end
end

function draw_world_clam_count()
  -- todo:clam score/clam count cleanup?
  spr(102,94,0,1,1)
  clam_score = clam_count
  if (clam_score>32000) then
    clam_score-=32000
  end
  clam_digits=#tostr(clam_score)
  clam_str=sub('0000',clam_digits,-1)

  print("~"..clam_str..clam_score,103,2,1)
end

function draw_stat_menu()
  cls(15)
  color(text_color_inv)

  draw_stat_pet()
  draw_stat_box()
  draw_stat_cursor()
end

function draw_shop()
  cls(15)
  color(text_color_inv)

  draw_shop_keeper()
  draw_shop_box()
  draw_shop_cursor()
end

function draw_shop_menu()
  cls(0)
  color(text_color)
  print("shop menu")
end

function draw_minigames()
  cls(3)
  color(text_color_inv)
  print("minigames")
end
