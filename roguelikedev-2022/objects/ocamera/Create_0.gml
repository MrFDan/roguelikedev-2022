// Camera modes
enum CAMERA_MODE
{
	NONE,
	FOLLOW_TARGET,
	MOVE_TO_TARGET
}

camera_mode = CAMERA_MODE.NONE;
camera_x = 0;
camera_y = 0;
camera_target = noone;
camera_previous_target = noone;
camera_width = camera_get_view_width(view_camera[0]);
camera_height = camera_get_view_height(view_camera[0]);
camera_move_speed = 0.1;