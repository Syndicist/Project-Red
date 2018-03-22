///move_state()

if(!place_meeting(x,y+1,Solid))
{
    vspd += grav;
    
    // Player is in the air
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = (vspd > 0);    
    
    // Control jump height
    if(space_release && vspd < -8)
        vspd = -8;
        
    // Standing jump speed
    if(right && hspd <=0)
        hspd = spd/2;
    if(left && hspd >= 0)
        hspd = -spd/2;
    if(alarm[0]>0 && space)
        vspd = -12;
} 
else 
{
    alarm[0] = 3;
    vspd = 0;
    
    // Standing Jump Height
    if(space && hspd == 0) 
    {
        vspd = -16;
        audio_play_sound(snd_jump, 5, false);
    }
    else if(space) // Running jump height
    {
        vspd = -12;
        audio_play_sound(snd_jump, 5, false);
    }
    // Player is on ground
    if(hspd==0)
        sprite_index = spr_player_idle;
    else
    {
        sprite_index = spr_player_walk;
        image_speed = .6;
    }
    if(right)
        hspd = spd;
    else if(left)
        hspd = -spd
    else 
        hspd = 0;
}

if(hspd != 0)
    image_xscale = sign(hspd);

//Land sound
if(place_meeting(x, y+vspd+1, Solid) && vspd > 0)
{
    audio_emitter_pitch(audio_em, random_range(.8,1.2));
    audio_emitter_gain(audio_em, .2);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
    
move(Solid);

// Check for ledge grab
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+17*image_xscale, yprevious, Solid);
var is_wall = position_meeting(x+17*image_xscale, y, Solid);

if(falling && wasnt_wall && is_wall)
{
    hspd = 0;
    vspd = 0;
    // Snap to ledge side
    while(!place_meeting(x+image_xscale, y, Solid))
        x+=image_xscale;
    // Snap to ledge height
    while(position_meeting(x+17*image_xscale, y-1, Solid))
        y-=1;
    
    sprite_index = spr_player_ledgegrab;
    state = ledge_grab_state;
    // Ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, .1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
