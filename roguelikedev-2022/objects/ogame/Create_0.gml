// Initialize game map
for (var i = 0; i < GRID_WIDTH; i++)
{
	for (var j = 0; j < GRID_HEIGHT; j++)
	{
		game_map[i, j] = instance_create_layer(i*TILE_SIZE, j*TILE_SIZE, "Tiles", oGround)
		with (game_map[i, j])
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