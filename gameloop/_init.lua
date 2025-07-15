-- octopet
-- by nice_nate

function _init()
data_found = cartdata("nice_nate_octopet_v1")
state = "main_menu"
menuitem(1, "new game", manage_save_state)

-- colors
text_color     = 6
text_color_inv = 0
pet_color = {
    eyebrowfill=4, eyebrowline=0,
    eyefill=7,         eyeline=0,
    pupilfill=12,    pupilline=0,
    bodyfill=9,
    mouthfill=10,    mouthline=0,
    tongue=1,
}

-- world page --
-- todo: on change, update text
world_h = 128
world_w = 128
info_bar_h = 7
clam_count = 0 -- todo: this will need to be preseved between runs
world_pkups = {}
world_pet = {
    x = 63,
    y = 63,
    state = 64,
    is_left = false,
    set_face = "smile",
    face = {
        smile=64,open=67,frown=80,
        hurt=83,blink=84
    }
}

-- stats page --
-- pet location
stat_pet_startpoint = {x=32,y=56}
stat_pet_midpoint = {x=32,y=56}
stat_pet_radius = 45
stat_pet_pupil_offset = {x=0,y=0}
stat_pet_leg_offset = {x=0,y=0}

-- stats
-- these are overridden by
-- set_file_defaults()
stat_box = {
    x0=63,
    y0=0,
    x1=127,
    y1=127,
    clr=12,
    pet_name="octopet",
    stat_index = 0,
    available_exp = 0,
}

stats = {
  {name="health", level=0, symbol="♥"},
  {name="speed", level=0, symbol="▒"},
  {name="suction", level=0, symbol="✽"},
  {name="stretch", level=0, symbol="∧"}
}

-- shop
shop_box = {
    x0=63,
    y0=0,
    x1=127,
    y1=127,
    clr=12
}

shop_items = {
    "bait", 10, "attracts more food",
    "repel", 20, "reduces enemies",
    "mult", 30, "improve pickup rate"
}

-- cursor
cursor_stats = {
    x=stat_box.x1-20,
    y=stat_box.y0+(6*(stat_box.stat_index+2))
}
cursor_on_pet = false
cursor_location = cursor_stats
cursor_spr = 2

-- animation indices & states
blink_ai          = 0
blink_state       = 0 -- 0=open,1=half,2=closed
blink_rate        = 120
blink_randomness  = rnd(blink_rate)
blink_open_delay  = 5

pupil_flick_ai    = 0
pupil_flick_state = 0
pupil_script      = {{0,0},{-4,0},{4,-4}}

body_shift_ai     = 0
body_shift_state  = 0
end
