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


hSpeed = moveH * walkspeed;
vSpeed = moveV * walkspeed;



// Horizontal Collision ///
if (place_meeting(x+hSpeed, y, oHouse))
{
	while (!place_meeting(x+sign(hSpeed), y, oHouse))
	{
		x += sign(hSpeed);
	}
	hSpeed = 0;
}
x += hSpeed;

// Vertical Collision ////
if (place_meeting(x, y+vSpeed, oHouse))
{
	while (!place_meeting(x, y+sign(vSpeed), oHouse))
	{
		y += sign(vSpeed);
	}
	vSpeed = 0;
}
y += vSpeed;

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

if keyboard_check(vk_right)
{
    hspeed = 1;
}
else if keyboard_check(vk_left)
{
    hspeed = -1;
}

else
hspeed = 0;

if(hspeed > 0)
{
if !audio_is_playing(Walking)
audio_play_sound(Walking, 1, true);
} 
else if(hspeed < 0)
{
if !audio_is_playing(Walking)   
audio_play_sound(Walking, 1, true);
}
 else
{
audio_stop_sound(Walking);
}	
