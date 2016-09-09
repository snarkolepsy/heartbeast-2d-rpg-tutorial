/// scr_dash_state

// fixing the "always dashing to the right when not moving" bug
if (len == 0) { // if not moving, dash in direction facing
    dir = face * 90; // convert current facing direction to angle
}

// when moving, will dash in direction moving

// set the length
len = spd * 4;

// get the horizontal and vertical speed
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

// move the sprite's physical position
phy_position_x += hspd;
phy_position_y += vspd;

// Create the dash effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
