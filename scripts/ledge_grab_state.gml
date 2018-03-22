///ledge_grab_state()
// fall
if(down)
{
    state = move_state;
}
// jump 
if(space)
{
    state = move_state;
    vspd = -16;
    audio_play_sound(snd_jump, 4, false);
}
// climb
if(up)
{
    state = move_state;
    x += image_xscale;
    y -= 18;
}
