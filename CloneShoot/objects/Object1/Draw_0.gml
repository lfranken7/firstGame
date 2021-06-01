/// @description Draw Sprites and Debug Text
// You can write your code in this editor

if(faceDir = facing.right)
	draw_sprite_ext(sprPlayer,0,x,y,1,1,0,c_white,255);
else
	draw_sprite_ext(sprPlayer,0,x,y,-1,1,0,c_white,255);