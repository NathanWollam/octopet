function _update()
  if state == "main_menu" then
    update_main_menu()
  elseif state == "world" then
    update_world()
  elseif state == "stat_menu" then
    update_stat_menu()
  elseif state == "shop" then
    update_shop()
  elseif state == "shop_menu" then
    update_shop_menu()
  elseif state == "minigames" then
    update_minigames()
  elseif state == "debug" then
    update_debug()
  end
end
