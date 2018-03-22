///spider_idle_state

if(instance_exists(Player))
{
    var dis = distance_to_object(Player);
    if (dis < sight && alarm[0] <= 0)
    {
        image_speed = .5;
        
        if(Player.x != x)
            image_xscale = sign(Player.x-x);
    }
}
