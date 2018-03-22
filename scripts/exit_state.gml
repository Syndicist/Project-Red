///exit_state
if(image_alpha > 0)
    image_alpha-=.25;
else
{  
    if(room != room_last)
        room_goto_next();
    else
    {
        score = round
        (
            (
                (PlayerStats.bosses_killed * 20) 
                + (PlayerStats.enemies_killed * 2) 
                + (PlayerStats.sapphires * 10)
            ) 
            * PlayerStats.hp
            * power(.9,floor(floor(PlayerStats.time/room_speed)/10)));
        
        ini_open("highscore.ini");
        PlayerStats.highscore = ini_read_real("Score", "Highscore", 0);
        if(score > PlayerStats.highscore)
        {
            PlayerStats.highscore = score;
            ini_write_real("Score", "Highscore", PlayerStats.highscore);
        }
        ini_close();
        room_goto(rm_highscore);
    }
}

