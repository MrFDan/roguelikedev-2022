function move_on_grid(_grid_x, _grid_y)
{
	#region Movement
	
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
	
	#endregion
	
	#region Fighting
		
		var _target = global.game_map[grid_x + _grid_x, grid_y + _grid_y];
		if (_target.tile_occupant != -1 && _target.tile_occupant.entity_blocks)
		{
			show_debug_message("You kick the " + _target.tile_occupant.entity_name + " in the shins, much to its annoyance!");
			_grid_x = 0;
			_grid_y = 0;
		}
	
	#endregion
		
	// Commit to movement
	previous_grid_x = grid_x;
	previous_grid_y = grid_y;
	grid_x += _grid_x;
	grid_y += _grid_y;
	
	// Reset FOV
	with (par_tile)
	{
		tile_dark = true;
		tile_occupant = -1;
	}
	with (par_entity) entity_visible = false;
	
	global.game_state = GAME_STATE.ENEMY_TURN;
}

function update_position_on_grid()
{
	x = grid_x * TILE_SIZE;
	y = grid_y * TILE_SIZE;
}