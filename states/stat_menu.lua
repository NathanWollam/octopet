-- stats

function draw_stat_pet()
  make_stat_body()
  make_stat_eyes()
  make_stat_eyelids()
  make_stat_mouth()
  make_stat_legs()
end

function draw_stat_box()
  make_stat_box()
end

function draw_stat_cursor()
  if state == "stat_menu" then
    local x = stat_pet_startpoint.x-5
    local y = stat_pet_startpoint.y-40
    local yoff = 0

    if not cursor_on_pet then
      yoff = 12*stat_box.stat_index
      x = cursor_location.x
      y = cursor_location.y+yoff
    end

    palt(0,false)
    palt(8,true)
    spr(cursor_spr,x,y,2,2)
    palt()
  end
end

function make_stat_box()
  -- draw box for stats
  rectfill(
   stat_box.x0,
   stat_box.y0,
   stat_box.x1,
   stat_box.y1,
   stat_box.clr)

  -- draw text in statbox

  local stat_index = 1

  print(
   stat_box.pet_name,
   stat_box.x0+4,
   stat_box.y0+4,
   text_color_inv)

  stat_index += 1

  for v in all(stat_box.stats) do
    local val = v
    if type(val) == "number" then
      val = make_exp_bar(val)
    end
    print(val,
     stat_box.x0+4,
     stat_box.y0+(6*stat_index),
     text_color_inv)
    stat_index += 1
  end
end

function make_exp_bar(exp)
  local exp_bar = ""
  local max_exp = "███████"
  local min_exp = "▥▥▥▥▥▥▥"
  local not_exp = 7-exp
  if exp > 6 then
    return max_exp
  end
  return sub(max_exp,0,exp)..sub(min_exp,0,not_exp)
end

function make_stat_body()
  -- body (35,55) mid 45 radius
  circfill(
    stat_pet_midpoint.x,
    stat_pet_midpoint.y,
    stat_pet_radius,
    pet_color.bodyfill)
end

function make_stat_eyelids()
  if blink_state == 2 then
    rectfill(
      stat_pet_midpoint.x-25,
      stat_pet_midpoint.y-15,
      stat_pet_midpoint.x+25,
      stat_pet_midpoint.y+15,
      pet_color.bodyfill)
    rectfill(
      stat_pet_midpoint.x-22,
      stat_pet_midpoint.y+5,
      stat_pet_midpoint.x-9,
      stat_pet_midpoint.y+5,
      pet_color.eyeline)
    rectfill(
      stat_pet_midpoint.x+8,
      stat_pet_midpoint.y+5,
      stat_pet_midpoint.x+22,
      stat_pet_midpoint.y+5,
      pet_color.eyeline)
  elseif blink_state == 1 then
    rectfill(
      stat_pet_midpoint.x-25,
      stat_pet_midpoint.y-16,
      stat_pet_midpoint.x+25,
      stat_pet_midpoint.y+5,
      pet_color.bodyfill)
  end
end

function make_stat_mouth()
  -- set red to transparent clr
  -- then draw mouth sprite
  palt(0,false)
  palt(8,true)
  spr(
    0,
    stat_pet_midpoint.x-7,
    stat_pet_midpoint.y+20,
    2,1)
  palt()
end

function make_stat_eyes()
  -- left eyebrow
  ovalfill(
    stat_pet_midpoint.x-20,
    stat_pet_midpoint.y-25,
    stat_pet_midpoint.x-10,
    stat_pet_midpoint.y-20,
    pet_color.eyebrowfill)
  oval(
    stat_pet_midpoint.x-20,
    stat_pet_midpoint.y-25,
    stat_pet_midpoint.x-10,
    stat_pet_midpoint.y-20,
    pet_color.eyebrowline)

  -- left eye
  ovalfill(
    stat_pet_midpoint.x-25,
    stat_pet_midpoint.y-15,
    stat_pet_midpoint.x-5,
    stat_pet_midpoint.y+15,
    pet_color.eyefill)
  oval(
    stat_pet_midpoint.x-25,
    stat_pet_midpoint.y-15,
    stat_pet_midpoint.x-5,
    stat_pet_midpoint.y+15,
    pet_color.eyeline)

  -- left pupil
  ovalfill(
    stat_pet_midpoint.x-18 +
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y-6 +
      stat_pet_pupil_offset.y,
    stat_pet_midpoint.x-12 +
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y+7 +
      stat_pet_pupil_offset.y,
    pet_color.pupilfill)
  oval(
    stat_pet_midpoint.x-18 +
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y-6 +
      stat_pet_pupil_offset.y,
    stat_pet_midpoint.x-12 +
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y+7 +
      stat_pet_pupil_offset.y,
    pet_color.pupilline)

  -- right eyebrow
  ovalfill(
    stat_pet_midpoint.x+10,
    stat_pet_midpoint.y-25,
    stat_pet_midpoint.x+20,
    stat_pet_midpoint.y-20,
    pet_color.eyebrowfill)
  oval(
    stat_pet_midpoint.x+10,
    stat_pet_midpoint.y-25,
    stat_pet_midpoint.x+20,
    stat_pet_midpoint.y-20,
    pet_color.eyebrowline)

  -- right eye
  ovalfill(
    stat_pet_midpoint.x+5,
    stat_pet_midpoint.y-15,
    stat_pet_midpoint.x+25,
    stat_pet_midpoint.y+15,
    pet_color.eyefill)
  oval(
    stat_pet_midpoint.x+5,
    stat_pet_midpoint.y-15,
    stat_pet_midpoint.x+25,
    stat_pet_midpoint.y+15,
    pet_color.eyeline)

  -- right pupil
  ovalfill(
    stat_pet_midpoint.x+12+
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y-6+
      stat_pet_pupil_offset.y,
    stat_pet_midpoint.x+18+
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y+7+
      stat_pet_pupil_offset.y,
    pet_color.pupilfill)
  oval(
    stat_pet_midpoint.x+12+
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y-6+
      stat_pet_pupil_offset.y,
    stat_pet_midpoint.x+18+
      stat_pet_pupil_offset.x,
    stat_pet_midpoint.y+7+
      stat_pet_pupil_offset.y,
    pet_color.pupilline)
end

function make_stat_legs()
  palt(0,false)
  palt(8,true)
  sspr(48,0,16,16,32,95+stat_pet_leg_offset.y,30,30)
  sspr(48,0,16,16,3,95-stat_pet_leg_offset.y,30,30,true)
  palt()
end
