/// @description 

// get keyboard input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

if (key_jump and (!inair or (enable_double_jump and !double_jumped))) {
	vsp = -jumpsp;
	if (inair) double_jumped = true;
	else inair = true;
} else  {
	vsp += grav;
}

// calculate collision
// horizontal
if (place_meeting(x+hsp, y, oWall)) {
	while(!place_meeting(x+_move, y, oWall))
		x += _move;
	hsp = 0;
} else {
	x += hsp;
}

// vertical
if (place_meeting(x, y+vsp, oWall)) {
	while(!place_meeting(x, y+sign(vsp), oWall))
		y += sign(vsp);
	vsp = 0;
	inair = false;
	double_jumped = false;
} else {
	y += vsp;
}

// acquire
if (place_meeting(x, y, oDevice)) {
	oDevice.acquired(self);
}

// change stripe
// decide facing
if (key_left or key_right) {
	current_face = RIGHT;
	if (key_left) current_face = LEFT;
	if (current_face != face) {
		image_xscale *= -1;
		face = current_face;
	}
}
// decide stripe
if (inair) {
	sprite_index = sPlayerJump;
	image_speed = 0;
	if (-4 > vsp) image_index = 0;
	else if (0 >= vsp and vsp > -4) image_index = 1;
	else if (4 >= vsp and vsp > 0) image_index = 2;
	else image_index = 3;
} else {
	image_speed = 1
	if (key_left or key_right) {
		sprite_index = sPlayerRun;
	} else {
		sprite_index = sPlayerIdle;
	}
}
