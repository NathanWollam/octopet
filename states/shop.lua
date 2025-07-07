-- shop

function draw_shop_keeper()
end

function draw_shop_box()
  -- draw box for shop
  rectfill(
   shop_box.x0,
   shop_box.y0,
   shop_box.x1,
   shop_box.y1,
   shop_box.clr)

  -- draw text in shop box
  local shop_index = 1

  for v in all(shop_items) do
    local val = v
    if type(val) == "number" then
      val = make_currency(val)
    end
    print(val,
     shop_box.x0+4,
     shop_box.y0+(6*shop_index),
     text_color_inv)
    shop_index += 1
  end
end

function make_currency(cost)
  return "$"..cost
end

function draw_shop_cursor()
end
