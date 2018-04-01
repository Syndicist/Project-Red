///spider_idle_state

if(instance_exists(Player1))
{
    var dis = distance_to_object(Player1);
    if (dis < sight && alarm[0] <= 0)
    {
        image_speed = .5;
        
        if(Player1.x != x)
            image_xscale = sign(Player1.x-x);
    }
}
