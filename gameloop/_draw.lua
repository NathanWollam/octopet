function _draw()
  if state == "main_menu" then
    draw_main_menu()
  elseif state == "world" then
    draw_world()
  elseif state == "stat_menu" then
    draw_stat_menu()
  elseif state == "shop" then
    draw_shop()
  elseif state == "shop_menu" then
    draw_shop_menu()
  elseif state == "minigames" then
    draw_minigames()
  elseif state == "debug" then
    draw_debug()
  end
end
