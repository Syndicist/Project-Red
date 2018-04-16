///enemy_move_state
var wall_at_right = place_meeting(x+1, y, Solid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, Solid);
var wall_at_left = place_meeting(x-1, y, Solid);
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, Solid);

if((wall_at_right || ledge_at_right) && image_xscale == 1)
    image_xscale = image_xscale * -1;
if((wall_at_left || ledge_at_left) && image_xscale == -1)
    image_xscale = image_xscale * -1;
x += image_xscale*spd;

if(instance_exists(Player1))
{
    if(Player1.y == y)
    {
        var dis = point_distance(x, y, Player1.x, Player.y);
        if(dis<sight)
        {
            if(type == types.woodeater)
                state = woodeater_attack_state;
        }
    }
}
