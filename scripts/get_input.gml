///get_input

right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
space = keyboard_check(vk_space);
space_release = keyboard_check_released(vk_space);
down = keyboard_check(vk_down);
up = keyboard_check_released(vk_up);

// Override controls for gamepad
var gp_id = 0;
var th = .5;
A_button = gp_face1;
B_button = gp_face2;
Y_button = gp_face3;
X_buttom = gp_face4;

if(gamepad_is_connected(gp_id))
{
    right = gamepad_axis_value(gp_id, gp_axislh) > th;
    left = gamepad_axis_value(gp_id, gp_axislh) < -th;
    space = gamepad_button_check_pressed(gp_id, A_button);
    space_release = gamepad_button_check_released(gp_id, A_button);
    down = gamepad_axis_value(gp_id, gp_axislv) > th;
    up = gamepad_axis_value(gp_id, gp_axislv) < -th;
    
}
