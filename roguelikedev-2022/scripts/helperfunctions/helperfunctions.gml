function MoveOnGrid(_grid_x, _grid_y)
{
	
	var _travel_cost = global.game_map[grid_x + _grid_x, grid_y + _grid_y].tile_travel_cost;
	
	if (_travel_cost > movement_points)
	{
		_grid_x = 0;
		_grid_y = 0;
	}
	
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
	
	// Apply the travel cost
	if (_grid_x != 0 || _grid_y != 0) movement_points -= _travel_cost;
		
	// Commit to movement
	grid_x += _grid_x;
	grid_y += _grid_y;
}

function UpdatePositionOnGrid()
{
	x = grid_x * TILE_SIZE;
	y = grid_y * TILE_SIZE;
}