camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

switch (camera_mode)
{
	case CAMERA_MODE.NONE:
	
	break;
	
	case CAMERA_MODE.FOLLOW_TARGET:
		if (!instance_exists(camera_target)) break;
		camera_x = camera_target.x - (camera_width / 2);
		camera_y = camera_target.y - (camera_height / 2);
	break;
	
	case CAMERA_MODE.MOVE_TO_TARGET:
		if (!instance_exists(camera_target)) break;
		camera_x = lerp(camera_x, camera_target.x - (camera_width / 2), camera_move_speed);
		camera_y = lerp(camera_y, camera_target.y - (camera_height / 2), camera_move_speed);
	break;
}

camera_x = clamp(camera_x, 0, room_width - camera_width);
camera_y = clamp(camera_y, 0, room_height - camera_height);

camera_set_view_pos(view_camera[0], camera_x, camera_y);