-- persistent data

function update_file()
dset(1, stat_box.available_exp)
dset(2, stats[1].level)
dset(3, stats[2].level)
dset(4, stats[3].level)
dset(5, stats[4].level)
end

function load_file()
stat_box.available_exp = dget(1)
stats[1].level = dget(2)
stats[2].level = dget(3)
stats[3].level = dget(4)
stats[4].level = dget(5)
end

function set_file_defaults()
dset(1,10)-- available
dset(2,0) -- health
dset(3,0) -- speed
dset(4,0) -- suction
dset(5,0) -- stretch
load_file()
end
