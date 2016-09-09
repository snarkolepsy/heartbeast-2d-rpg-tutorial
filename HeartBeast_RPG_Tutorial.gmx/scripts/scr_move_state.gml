/// scr_move_state

// check if dash key is pressed, and has enough stamina
if (obj_input.dash_key) {
    // prioritizes speaking before dashing
    
    // dash key triggers sign text if close enough to sigh - CONTEXT SENSITIVE
    var xdir = lengthdir_x(8, face * 90);
    var ydir = lengthdir_y(8, face * 90);
    
    // if there is a speaker where we are looking return its ID
    var speaker = instance_place(x + xdir, y + ydir, obj_speaker);
    
    if (speaker != noone) {
        // talk to it
        with (speaker) {
            // if the object does not exist, create it
            if (!instance_exists(dialog)) {
                dialog = instance_create(x + xoffset, y + yoffset, obj_dialog);
                dialog.text = text;
            }
            else {
                dialog.text_page++; // go the next page
                dialog.text_count = 0; // reset letter place
                if (dialog.text_page > array_length_1d(dialog.text) - 1) {
                    with (dialog) {
                        instance_destroy();
                    }
                }
            }
        }
    }
    else if (obj_player_stats.stamina >= DASH_COST) {
        // dash
        state = scr_dash_state;
        alarm[0] = room_speed/7;
    
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[0] = room_speed;
    }
}

// check if the attack ket is pressed
if (obj_input.attack_key) {
    // rest to the 0th frame, so the attack animation starts at 0
    image_index = 0;
    
    state = scr_attack_state;
}

// use the axes to get the direction in angles
dir = point_direction(0, 0, obj_input.xaxis, obj_input.yaxis);

// get the length
if (obj_input.xaxis == 0 and obj_input.yaxis == 0) { // not moving
    len = 0;
}
else { // moving
    len = spd;
    scr_get_face();
}

// get the horizontal and vertical speed
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// move the sprite's physical position
phy_position_x += hspd;
phy_position_y += vspd;

// control the sprite
image_speed = 0.2;
if (len == 0) { image_index = 0; }

switch (face) {
    case RIGHT:
        sprite_index = spr_player_right;
        break;
    case UP:
        sprite_index = spr_player_up;
        break;
    case LEFT:
        sprite_index = spr_player_left;
        break;
    case DOWN:
        sprite_index = spr_player_down;
        break;
}
