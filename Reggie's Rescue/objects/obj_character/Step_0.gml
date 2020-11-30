// Moving around
spd = 3;
input_right = keyboard_check(vk_right);
input_left = keyboard_check(vk_left);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);
if (input_right) x = x + spd;
if (input_left) x = x - spd;
if (input_up) y = y - spd;
if (input_down) y = y + spd;

image_angle = point_direction(x, y, mouse_x, mouse_y)

//Shoot
if(mouse_check_button(mb_left)) && (cooldown < 1)
{
	instance_create_layer(x, y, "BulletsLayer", obj_bullet)
	cooldown = 5;
}

cooldown -= 1;