if (instance_exists(objcorgi))
{
	move_towards_point(objcorgi.x, objcorgi.y, spd);
}
image_angle = direction;

if (hp <=0 ) instance_destroy();
<<<<<<< HEAD

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

=======
>>>>>>> parent of db30abd... Collisions
