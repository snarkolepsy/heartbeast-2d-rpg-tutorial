/// scr_attack_state

// set it to the animation speed
image_speed = 0.5;

// set it to the correct attack animation
switch(sprite_index) {
    case spr_player_down:
        sprite_index = spr_player_attack_down;
        break;
    case spr_player_up:
        sprite_index = spr_player_attack_up;
        break;
    case spr_player_left:
        sprite_index = spr_player_attack_left;
        break;
    case spr_player_right:
        sprite_index = spr_player_attack_right;
        break;
}

// create the damage object when the player attacks

// specify the frame during the attack animation (frame 4 aka index 3)
if (image_index  >= 3 and attacked = false) {

    var xx = 0;
    var yy = 0;

    // place the damage object in front of the player
    switch(sprite_index) {
        case spr_player_attack_down:
            xx = x;
            yy = y + 12;
            break;
        case spr_player_attack_up:
            xx = x;
            yy = y - 10;
            break;
        case spr_player_attack_right:
            xx = x + 10;
            yy = y + 2;
            break;
        case spr_player_attack_left:
            xx = x - 10;
            yy = y + 2;
            break;
    }

    var damage = instance_create(xx, yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack;
    attacked = true;
}
