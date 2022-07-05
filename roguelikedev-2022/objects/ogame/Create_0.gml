// Initialize game map
for (var i = 0; i < GRID_WIDTH; i++)
{
	for (var j = 0; j < GRID_HEIGHT; j++)
	{
		global.game_map[i, j] = instance_create_layer(i*TILE_SIZE, j*TILE_SIZE, "Tiles", oSand)
		with (global.game_map[i, j])
		{
			grid_x = i;
			grid_y = j;
		}
	}
}

// Initialize the Player
global.player = instance_create_layer(0, 0, "Instances", oPlayer);

with (global.player)
{
	grid_x = 40;
	grid_y = 25;
}

// Initialize game variables
global.turn = TURN_ORDER.PLAYER;

// Create the camera
if (!instance_exists(oCamera))
{
	global.camera = instance_create_layer(0, 0, "UI", oCamera);
}
global.camera.camera_target = global.player;
global.camera.camera_mode = CAMERA_MODE.FOLLOW_TARGET;