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

#region // TEMP

	// Set world boundaries
	for (var i = 0; i < GRID_WIDTH; i++)
	{
		with (global.game_map[i, 0]) instance_change(oWall, true);
		with (global.game_map[i, GRID_HEIGHT - 1]) instance_change(oWall, true);
	}
	for (var j = 1; j < GRID_HEIGHT - 1; j++)
	{
		with (global.game_map[0, j]) instance_change(oWall, true);
		with (global.game_map[GRID_WIDTH - 1, j]) instance_change(oWall, true);
	}
	
	// Dunes
	with (global.game_map[1, 1]) instance_change(oDunes, true);
	with (global.game_map[2, 1]) instance_change(oDunes, true);
	with (global.game_map[3, 1]) instance_change(oDunes, true);
	with (global.game_map[1, 2]) instance_change(oDunes, true);
	with (global.game_map[2, 2]) instance_change(oDunes, true);
	with (global.game_map[1, 3]) instance_change(oDunes, true);

#endregion

// Initialize the Player
global.player = instance_create_layer(0, 0, "Instances", oPlayer);

with (global.player)
{
	grid_x = 8;
	grid_y = 4;
}

// Initialize game variables
global.turn_phase = TURN_ORDER.TURN_START;
global.turn_count = 0;

// Create the camera
if (!instance_exists(oCamera))
{
	global.camera = instance_create_layer(0, 0, "UI", oCamera);
}
global.camera.camera_target = global.player;
global.camera.camera_mode = CAMERA_MODE.FOLLOW_TARGET;