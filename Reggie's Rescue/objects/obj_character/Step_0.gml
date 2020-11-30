// Moving around
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
key_jump = keyboard_check_pressed(vk_space);

//calculating movement
var moveH = key_right - key_left;
var moveV = key_down - key_up;

hsp = moveH * walksp;
vsp = moveV * walksp;

//vertical collision
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp), y, oWall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

//Horizontal collision
if (place_meeting(y+vsp, x, oWall))
{
	while (!place_meeting(y+sign(vsp), x, oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

x += hsp;
y += vsp;


/*
if (keyboard_check(vk_right)) x += 4;
if (keyboard_check(vk_left)) x -= 4;
if (keyboard_check(vk_up)) y -= 4;
if (keyboard_check(vk_down)) y += 4;
*/

image_angle = point_direction(x, y, mouse_x, mouse_y)

//Shoot
if(mouse_check_button(mb_left)) && (cooldown < 1)
{
	instance_create_layer(x, y, "BulletsLayer", obj_bullet)
	cooldown = 5;
}

cooldown -= 1;