///bat_idle_state
image_index = spr_bat_idle;

if(instance_exists(Player1))
{
    var dis = point_distance(x, y, Player1.x, Player1.y);
    if(dis<sight)
        state = bat_chase_state;
}
