/// scr_save_game();

// make sure the player object exists - can't save when dead
if (!instance_exists(obj_player_stats)) {
    exit;
}

// create the save dats structure
var save_data = ds_map_create();

// save stats to file
with (obj_player_stats) {
    // place player stats into data structure
    save_data[? "room"] = previous_room; // ? is an accessor - access a certain value
    save_data[? "x"] = player_xstart;
    save_data[? "y"] = player_ystart;
    save_data[? "hp"] = hp;
    save_data[? "maxhp"] = maxhp;
    save_data[? "stamina"] = stamina;
    save_data[? "maxstamina"] = maxstamina;
    save_data[? "expr"] = expr;
    save_data[? "maxexpr"] = maxexpr;
    save_data[? "level"] = level;
    save_data[? "attack"] = attack;
}

// encode the map into a JSON string
// javascript object notation
var save_string = json_encode(save_data);

// destroy/free the memory  
ds_map_destroy(save_data);

// encrpt the save file
save_string = base64_encode(save_string);

// open file, write JSON string to it, and exit
// show_message(working_directory); // for debug purposes - find out where file is stored
var file = file_text_open_write(working_directory + "mysavegame.txt");
file_text_write_string(file, save_string);
file_text_close(file);

show_message("Game Saved");
