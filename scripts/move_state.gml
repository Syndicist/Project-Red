///move_state()

if(!place_meeting(x,y+1,Solid))
{
    vspd += grav;
    
    // Player is in the air
    // TODO: sprite_index = spr_player1_jump;
    sprite_index = spr_player1_run;
    image_index = 0;
    image_speed = 0;
    //image_index = (vspd > 0);    
    
    // Control jump height
    if(space_release && vspd < -8)
        vspd = jspd;
        
    // Standing jump speed
    if(right && hspd <= 0)
        hspd = spd/2;
    if(left && hspd >= 0)
        hspd = -spd/2;
    // Jump forgiveness
    if(alarm[0]>0 && space)
        vspd = jspd;
} 
else 
{
    alarm[0] = 3;
    vspd = 0;
    
    if(space) // Jump height
    {
        vspd = jspd;
        audio_play_sound(snd_jump, 5, false);
    }
    // Player is on ground
    if(!right && !left)
    {
        sprite_change(spr_player1_idle);
    }
    else
    {
        sprite_change(spr_player1_run);
        image_speed = .3;
    }
    if(right)
        hspd = spd;
    else if(left)
        hspd = -spd
    else 
        hspd = 0;
}

//Face direction of movement
if(hspd != 0)
    image_xscale = sign(hspd);

//Land sound
if(place_meeting(x, y+vspd+1, Solid) && vspd > 0)
{
    audio_emitter_pitch(audio_em, random_range(.8,1.2));
    audio_emitter_gain(audio_em, .2);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}

// Attack forward
if(attack && alarm[2]<=0)
{
    hspd = 0;
    vspd = 0;
    alarm[1] = 18;
    alarm[2] = 40;
    sprite_change(spr_player1_slash_attack);
    image_speed = .2;
    state = attack_state;
}

move(Solid);

// Check for ledge grab
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+10*image_xscale, yprevious, Solid);
var is_wall = position_meeting(x+10*image_xscale, y, Solid);

if(falling && wasnt_wall && is_wall)
{
    hspd = 0;
    vspd = 0;
    // Snap to ledge side
    while(!place_meeting(x+image_xscale, y, Solid))//
        x+=1*image_xscale;
    // Snap to ledge height
    while(position_meeting(x+16*image_xscale, y-32, Solid))
        y-=1;
    
    // TODO: sprite_index = spr_player1_ledgegrab;
    state = ledge_grab_state;
    // Ledge grab sound
    audio_emitter_pitch(audio_em, 1.5);
    audio_emitter_gain(audio_em, .1);
    audio_play_sound_on(audio_em, snd_step, false, 6);
}
