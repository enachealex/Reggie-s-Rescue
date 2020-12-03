walkRight = keyboard_check(ord("D")) || keyboard_check(vk_right);
walkLeft = keyboard_check(ord("A")) || keyboard_check(vk_left);
walkUp = keyboard_check(ord("W")) || keyboard_check(vk_up);
walkDown = keyboard_check(ord("S")) || keyboard_check(vk_down);
sprint = keyboard_check(vk_shift);

if (walkRight){
    x += walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = corgiwalkright;
}
if (walkLeft){
    x -= walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkleft;
}
if (walkUp){
    y -= walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkup;
}
if (walkDown){
    y += walkspeed;
    image_speed = walkspeed / 3;
    sprite_index = sprcorgiwalkdown;
}
if (keyboard_check(vk_nokey)) {
    image_speed = 0;
    image_index = 0;
	walkspeed = 3.5;
}
if(sprint) {
	walkspeed = 7;
}