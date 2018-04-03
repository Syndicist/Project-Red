///ledge_grab_state()
// fall
if(down)
{
    state = move_state;
}
// jump off ledge
if(space)
{
    vspd = jspd;
    hspd = spd*-image_xscale;
    state = move_state;
    
    audio_play_sound(snd_jump, 4, false);
}
// climb up ledge
if(up)
{
    state = move_state;
    x += 14*image_xscale;
    y -= 48;
}
