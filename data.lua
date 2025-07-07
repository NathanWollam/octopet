-- persistent data

function update_file()
dset(1, stat_box.available_exp)
dset(2, stat_box.stats[2])
dset(3, stat_box.stats[4])
dset(4, stat_box.stats[6])
dset(5, stat_box.stats[8])
end

function load_file()
stat_box.available_exp = dget(1)
stat_box.stats[2] = dget(2)
stat_box.stats[4] = dget(3)
stat_box.stats[6] = dget(4)
stat_box.stats[8] = dget(5)
end

function set_file_defaults()
dset(1,10)-- available
dset(2,0) -- health
dset(3,0) -- speed
dset(4,0) -- suction
dset(5,0) -- stretch
load_file()
end
