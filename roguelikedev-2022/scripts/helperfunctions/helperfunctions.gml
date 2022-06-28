function MoveOnGrid(_grid_x, _grid_y)
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
	
	// Commit to movement
	grid_x += _grid_x;
	grid_y += _grid_y;
}

function UpdatePositionOnGrid()
{
	x = grid_x * TILE_SIZE;
	y = grid_y * TILE_SIZE;
}