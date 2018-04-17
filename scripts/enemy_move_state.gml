///enemy_move_state
var wall_at_right = place_meeting(x+1, y, Solid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, Solid);
var wall_at_left = place_meeting(x-1, y, Solid);
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, Solid);
if(type == types.terminite)
    sprite_change(spr_terminite_walk);
image_speed = .3;

if(!place_meeting(x,y+1,Solid))
    vspd += grav;
else
{
    if(wall_at_right || ledge_at_right)
        image_xscale = -1;
    if(wall_at_left || ledge_at_left)
        image_xscale = 1;
    hspd = image_xscale*spd;
    vspd = 0;
    if(instance_exists(Player1))
    {
        if(Player1.y == y)
        {
            var dis = point_distance(x, y, Player1.x, Player1.y);
            if(dis<sight)
            {
                alarm[0] = 18
                if(type == types.terminite)
                    state = terminite_attack_state;
            }
        }
    }
}
move(solid);
