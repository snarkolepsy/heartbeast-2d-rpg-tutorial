/// scr_enemy_chase_state
// if the player exists, gradually move closer to player
scr_check_for_player();

var dir = point_direction(x, y, targetx, targety);
var hspd = lengthdir_x(spd, dir);
var vspd = lengthdir_y(spd, dir);

if (hspd != 0) {
    // makes the slime "face" the player
    image_xscale  = sign(hspd);
}

phy_position_x += hspd;
phy_position_y += vspd;
