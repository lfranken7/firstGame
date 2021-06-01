/// @description Insert description here
// You can write your code in this editor



// Jump Command
if(keyboard_check_pressed(vk_space))
{
	if(!place_free(x,y+1))
	{
		vSpeed = jSpeed; // jSpeed is negative 
	}
}

// Remove upwards velocity if going up -- TODO: CREATE LOCK FOR INPUTS
if (keyboard_check_released(vk_space) && vSpeed < 0)
{
	vSpeed = 0;
}

// Stop hSpeed if no key pressed -- TODO: make a more explicit check as this is only an assertion of 0
hSpeed = 0;
// Movement Control
if(keyboard_check(ord("D")))
{
	faceDir = facing.right;
	hSpeed = hSpeedWalk;
}
if(keyboard_check(ord("A")))
{
	faceDir = facing.left;
	hSpeed = -hSpeedWalk;
}






// Gravity Update
// Check if grounded or not for Gravity Update
if(place_free(x,y+1)) // Check if room to fall
{
	vSpeed += gSpeed;
}
else
{
	if(vSpeed > 0)
		vSpeed = 0;
}

// Ceiling Collision
if(!place_free(x,y-1) && vSpeed < 0)
{
	vSpeed = 0;
}

// Clamp Maximum Values and Update Position
clamp(vSpeed, -vSpeedMax,vSpeedMax);
clamp(hSpeed, -hSpeedMax,hSpeedMax);

if(vSpeed > 0) move_contact_solid(gDir,vSpeed);
else if (vSpeed < 0) move_contact_solid((gDir-180), abs(vSpeed));

if(hSpeed > 0) move_contact_solid(0,hSpeed);
else if (hSpeed < 0) move_contact_solid(180, abs(hSpeed));