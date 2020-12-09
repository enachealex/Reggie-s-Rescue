if (place_meeting(x+speed, y, oHouse))
{
	while (!place_meeting(x+sign(speed), y, oHouse))
		x += sign(speed);
		
	instance_destroy();
}

if (place_meeting(x, y+speed, oHouse))
{
	while (!place_meeting(x, y+sign(speed), oHouse))
		y += sign(speed);
		
	instance_destroy();
}
