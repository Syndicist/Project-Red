/// terminite_attack_state
sprite_change(spr_terminite_attack);
image_speed = 0;
image_index = 0;
hspd = 0;
vspd = 0;
if(alarm[0]<=7 && alarm[0]>4)
{
    image_index = 1;
    instance_create(x+10*image_xscale, y, TerminiteAttackEffect);
}
if(alarm[0]<=0)
    state = enemy_move_state;
