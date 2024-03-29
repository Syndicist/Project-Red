///spider_jump_state

image_index = image_number-1;

// Apply gravity
if(!place_meeting(x, y+1, Solid))
    vspd += grav;
else
{
    vspd = 0;
    apply_friction(acc);
    
    //check idle
    if(hspd == 0 && vspd == 0)
    {
        state = spider_idle_state;
        alarm[0] = 15;
        image_speed = 0;
        image_index = 0;
    }
}

if(hspd != 0)
    image_xscale = sign(hspd);
    
// move
move_wall_bounce(Solid);
