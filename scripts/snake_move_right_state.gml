///snake_move_right_state
var wall_at_right = place_meeting(x+1, y, Solid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, Solid);

if(wall_at_right || ledge_at_right)
    state = snake_move_left_state;

image_xscale = 1;
x += 1;
