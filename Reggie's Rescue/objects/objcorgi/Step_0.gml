//variables for controls/movement
walkRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
walkLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
walkUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
walkDown = keyboard_check(ord("S")) || keyboard_check(vk_down);
sprint = keyboard_check(vk_shift);
bark = keyboard_check(vk_space);

//
//if (walkRight || walkLeft || walkUp || walkDown) audio_play_sound(Walking,5,false);
//else if (!walkRight || !walkLeft || !walkUp || !walkDown) audio_stop_sound(Walking);
// movement
var moveH = walkRight - walkLeft;
var moveV = walkDown - walkUp;


hspeed = moveH * walkspeed;
vspeed = moveV * walkspeed;



// Horizontal Collision ///
if (place_meeting(x+hspeed, y, oHouse))
{
	while (!place_meeting(x+sign(hspeed), y, oHouse))
		x += sign(hspeed);
		
	hspeed = 0;
}
x += hspeed;

// Vertical Collision ////
if (place_meeting(x, y+vspeed, oHouse))
{
	while (!place_meeting(x, y+sign(vspeed), oHouse))
		y += sign(vspeed);
		
	vspeed = 0;
}
y += vspeed;

// Corgi Animation ///
if (walkRight){
    //x += walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = corgiwalkright;
}

if (walkLeft){
    //x -= walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkleft;
}

if (walkUp){
    //y -= walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkup;
}

if (walkDown){
    //y += walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkdown;
}

if (keyboard_check(vk_nokey)) {
    image_speed = 0;
    image_index = 0;
	walkspeed = 2;
}

if (bark) audio_play_sound(DogBark,10,false)

if(sprint) walkspeed = 4;
else if (!sprint) walkspeed = 2;


// Sound of Reggie walking ///////////////
if(hspeed > 0 || vspeed > 0 || hspeed < 0 || vspeed < 0)
{
	if !audio_is_playing(Walking)
		audio_play_sound(Walking, 1, true);
} 
else audio_stop_sound(Walking);
