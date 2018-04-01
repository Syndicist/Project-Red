///attack_state
sprite_index = spr_player1_slash_attack
image_speed = .15;

// Start attack when animation reaches appropriate frame
if(alarm[1]<=7 && alarm[1]>4)
{
    // Attack moves player slightly forward
    hspd += 2*image_xscale;
    // Create attack effect in appropriate direction
    instance_create(x+10*image_xscale, y, PlayerAttackEffect);
}

if(alarm[1]==3)
    hspd = 0;   
move(Solid);
if(alarm[1]<=0)
    state = move_state;


