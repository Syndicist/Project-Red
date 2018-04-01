///bat_chase_state
if(instance_exists(Player1))
{
    // find player
    var dir = point_direction(x, y, Player1.x, Player1.y)
    hspd = lengthdir_x(spd, dir);
    vspd = lengthdir_y(spd, dir);
    
    // change sprites
    sprite_index = spr_bat_fly;
    if(hspd != 0)
        image_xscale = sign(hspd);
    
    // move
    move(Solid);
}
