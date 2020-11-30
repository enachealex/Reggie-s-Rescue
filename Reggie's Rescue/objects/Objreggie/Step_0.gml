

if (keyboard_check(ord("D"))){
	x += walkspeed;
	image_speed = walkspeed / 3;
	sprite_index = corgiwalkright
}
if (keyboard_check(ord("A"))){
	x -= walkspeed;
	image_speed = walkspeed / 3;
	sprite_index = sprcorgiwalkleft
}
if (keyboard_check(ord("W"))){
	y -= walkspeed;
	image_speed = walkspeed / 3;
	sprite_index = sprcorgiwalkup
}
if (keyboard_check(ord("S"))){
	y += walkspeed;
	image_speed = walkspeed / 3;
	sprite_index = sprcorgiwalkdown
}
if (keyboard_check(vk_nokey)) {
	image_speed = 0
	image_index = 0
}