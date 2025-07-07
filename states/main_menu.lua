-- main menu

function manage_save_state(operation)
  if operation == "load" then
    load_file()
  elseif operation == "update" then
    update_file()
  else
    set_file_defaults()
    state = "main_menu"
  end
end
