if (instance_exists(objcorgi))
{
	move_towards_point(objcorgi.x, objcorgi.y, spd);
}
image_angle = direction;

if (hp <=0 ) instance_destroy();
