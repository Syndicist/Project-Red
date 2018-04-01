///hurt_state

// TODO: sprite_index = spr_player_hurt;
if(hspd != 0)
    image_xscale = sign(hspd);

if(!place_meeting(x, y+1, Solid))
    vspd += grav;
else
{
    vspd = 0;
}

move_hurt(Solid);

if(place_meeting(x, y+1, Solid) || place_meeting(x+1, y, Solid))
{
    if(PlayerStats.hp <= 0)
    {
        //PlayerStats.score -= 5;
        PlayerStats.hp = PlayerStats.maxhp;
        audio_stop_all();
        room_restart();
    }
    image_blend = c_white;
    state = move_state;
}
