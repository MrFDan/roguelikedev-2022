// Initialize game map
for (var i = 0; i < GRID_WIDTH; i++)
{
	for (var j = 0; j < GRID_HEIGHT; j++)
	{
		global.game_map[i, j] = instance_create_layer(i*TILE_SIZE, j*TILE_SIZE, "Tiles", oFloor);
	}
}

// TEMP: Walls
with (global.game_map[20, 6]) instance_change(oWall, true);
with (global.game_map[21, 6]) instance_change(oWall, true);
with (global.game_map[22, 6]) instance_change(oWall, true);
with (global.game_map[23, 6]) instance_change(oWall, true);

// Initialize the player
global.player = instance_create_layer(0, 0, "Entities", oPlayer);

with (global.player)
{
	grid_x = 8;
	grid_y = 4;
}

// Create an NPC
global.npc = instance_create_layer(0, 0, "Entities", oNPC);

with (global.npc)
{
	grid_x = 16;
	grid_y = 4;
}

global.entities = [global.player, global.npc];