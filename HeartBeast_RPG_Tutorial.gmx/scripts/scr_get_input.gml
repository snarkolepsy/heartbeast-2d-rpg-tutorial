/// scr_get_input

// directional keyboard inputs
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);
right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);

// keyboard input for dash
dash_key = keyboard_check_pressed(ord('C'));

// keybaord input for attacking
attack_key = keyboard_check_pressed(ord('X'));

// key for pausing the game
pause_key = keyboard_check_pressed(ord('Z'));

// set the axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

// check for gamepad input - assumes an XBox 360 controller
if(gamepad_is_connected(0)) {
    // deadzone area so player stops moving under threshold
    gamepad_set_axis_deadzone(0, 0.35);
    
    // left analog stick controls movement
    xaxis = gamepad_axis_value(0, gp_axislh);
    yaxis = gamepad_axis_value(0, gp_axislv);
    
    // dash button mapped to A button
    dash_key = gamepad_button_check_pressed(0, gp_face1);
    
    // attack button is X button
    attack_key = gamepad_button_check_pressed(0, gp_face3);
    
    // pause button is Start button
    pause_key = gamepad_button_check_pressed(0, gp_start);
}
