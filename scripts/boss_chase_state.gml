///boss_chase_state
var dis = point_distance(x, y, Player1.x, y);
if(dis < sprite_width/2-16)
{
    state = boss_smash_state;
    audio_play_sound(snd_jump, 6, false);
    hspd=0;
}
else
    hspd = (Player1.x - x) * .05;
    
move(Solid);
