function move_on_grid(_grid_x, _grid_y)
{
	
	// Constrain movement to the grid size
	if (grid_x + _grid_x < 0) || (grid_x + _grid_x > GRID_WIDTH-1)
	{
		_grid_x = 0;
	}
	
	if (grid_y + _grid_y < 0) || (grid_y + _grid_y > GRID_HEIGHT-1)
	{
		_grid_y = 0;
	}
	
	// Tile collisions
	if (grid_x > 0 && grid_x < GRID_WIDTH-1)
	{
		if (!global.game_map[grid_x + _grid_x, grid_y].tile_walkable) _grid_x = 0;
	}
	
	if (grid_y > 0 && grid_y < GRID_HEIGHT-1)
	{
		if (!global.game_map[grid_x, grid_y + _grid_y].tile_walkable) _grid_y = 0;
	}
		
	// Commit to movement
	previous_grid_x = grid_x;
	previous_grid_y = grid_y;
	grid_x += _grid_x;
	grid_y += _grid_y;
	
	// Reset the darkness for the FOV to work
	with (par_tile)
	{
		tile_dark = true;
	}
}

function update_position_on_grid()
{
	x = grid_x * TILE_SIZE;
	y = grid_y * TILE_SIZE;
}