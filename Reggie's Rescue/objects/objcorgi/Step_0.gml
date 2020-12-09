//variables for controls/movement
walkRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
walkLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
walkUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
walkDown = keyboard_check(ord("S")) || keyboard_check(vk_down);
sprint = keyboard_check(vk_shift);
bark = mouse_check_button(mb_left);
pooping = keyboard_check(vk_space);

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

// Corgi Animation along with pooping mechanism ///
if (walkRight){
    image_speed = walkspeed / 3;
    sprite_index = corgiwalkright;
}

else if (walkLeft){
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkleft;
}

else if (walkUp){
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkup;
}

else if (walkDown){
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkdown;		
}
	
if (keyboard_check(vk_nokey)) {
    image_speed = 0;
    image_index = 0;
	walkspeed = 1;
}

// Pooping functionality
if(pooping) {
	if (!audio_is_playing(Pooping))
		audio_play_sound(Pooping, 1, true);
	if (walkUp) {
		if (firingdelay < 1) {
			instance_create_layer(x, y+20, "BulletsLayer", obj_poop)
			firingdelay = 20;
		}
		firingdelay -= 1;
	}
	else if (walkDown) {
		if (firingdelay < 1) {
			instance_create_layer(x, y-20, "BulletsLayer", obj_poop)
			firingdelay = 20;
		}
		firingdelay -= 1;
	}
	
	else if (walkRight) {
		if (firingdelay < 1) {
			instance_create_layer(x-20, y, "BulletsLayer", obj_poop)
			firingdelay = 20;
		}
		firingdelay -= 1;
	}
	
	else if (walkLeft) {
		if (firingdelay < 1) {
			instance_create_layer(x+20, y, "BulletsLayer", obj_poop)
			firingdelay = 20;
		}
		firingdelay -= 1;
	}
	
	else {
		if (firingdelay < 1) {
			instance_create_layer(x, y, "BulletsLayer", obj_poop)
			firingdelay = 5;
		}
		firingdelay -= 1;
	}
}

else audio_stop_sound(Pooping);

//Barking functionality
if(bark)
{
	// changes tone of bark and plays the bark if it isnt already playing
	audio_sound_pitch(DogBark, random_range(0.9, 1.1));
	if (!audio_is_playing(DogBark))
		audio_play_sound(DogBark, 1, true);
		
	// creates "barks" to attack animals with
	if (cooldown < 1) {
		instance_create_layer(x, y, "BulletsLayer", obj_bark)
		cooldown = 20;
	}
	cooldown -= 1;
} 
else audio_stop_sound(DogBark);


// Sprinting movement and noise
if(sprint) 
{
	if (!audio_is_playing(DogPanting))
		audio_play_sound(DogPanting, 1, true);
	walkspeed = 2;
}
else if (!sprint) 
{
	audio_stop_sound(DogPanting);
	walkspeed = 1;
}

// Sound of Reggie walking ///////////////
if(hspeed > 0 || vspeed > 0 || hspeed < 0 || vspeed < 0)
{
	if !audio_is_playing(Walking)
		audio_play_sound(Walking, 1, true);
} 
else audio_stop_sound(Walking);
