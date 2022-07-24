function reset_tiles()
{
	with (par_tile)
	{
		tile_dark = true;
		//tile_occupant = noone;
		tile_color = c_white;
		tile_parent = noone;
		tile_g_score = 0;
		tile_move_node = false;
	}
}

function color_move_tiles(_tile, _entity_move, _entity_actions)
{
	if (_entity_actions > 1)
	{
		if (_tile.tile_g_score > _entity_move) _tile.tile_color = c_yellow;
		else _tile.tile_color = c_aqua;
	}
	else
	{
		_tile.tile_color = c_yellow;
	}
}

function calculate_movement_range(_start_tile, _entity_move, _entity_actions)
{
	// Reset all tiles' data
	reset_tiles();
	
	var _open = ds_priority_create();
	var _visited = ds_list_create();
	var _current;
	var _neighbor;
	var _temp_g;
	var _range = _entity_move * _entity_actions;
	var _cost_mod;
	
	// Add starting node to the open list
	ds_priority_add(_open, _start_tile, _start_tile.tile_g_score);
	
	// Go through all tiles on the list
	while (ds_priority_size(_open) > 0)
	{
		// Remove node with the lowest G score
		_current = ds_priority_delete_min(_open);
		ds_list_add(_visited, _current);
		
		// Step through all current's neighbors
		for (var i = 0; i < ds_list_size(_current.neighbors); i++)
		{
			_neighbor = ds_list_find_value(_current.neighbors, i);
			
			if (ds_list_find_index(_visited, _neighbor) < 0 and _neighbor.tile_walkable and _neighbor.tile_occupant == noone and _neighbor.tile_move_cost + _current.tile_g_score<= _range)
			{
				if (ds_priority_find_priority(_open, _neighbor) == 0 or ds_priority_find_priority(_open, _neighbor) == undefined)
				{
					_cost_mod = 1;
					_neighbor.tile_parent = _current;
					if (_neighbor.grid_x != _current.grid_x and _neighbor.grid_y != _current.grid_y) _cost_mod = 1.5; // diagonal neighbor
					
					// Calculate G score
					_neighbor.tile_g_score = _current.tile_g_score + (_neighbor.tile_move_cost * _cost_mod);
					
					ds_priority_add(_open, _neighbor, _neighbor.tile_g_score);
				}
				// If neighbor's G score has been already calculated
				else
				{
					_cost_mod = 1;
					if (_neighbor.grid_x != _current.grid_x and _neighbor.grid_y != _current.grid_y) _cost_mod = 1.5; // diagonal neighbor
					
					_temp_g = _current.tile_g_score + (_neighbor.tile_move_cost * _cost_mod);
					
					if (_temp_g < _neighbor.tile_g_score)
					{
						_neighbor.tile_parent = _current;
						_neighbor.tile_g_score = _temp_g;
						ds_priority_change_priority(_open, _neighbor, _neighbor.tile_g_score);
					}
				}
			}
		}
	}
	
	// Round down all G scores
	with (par_tile) tile_g_score = floor(tile_g_score);
	
	// Cleanup
	ds_priority_destroy(_open);
	
	// Color all move nodes
	for (var j = 0; j < ds_list_size(_visited); j++)
	{
		_current = ds_list_find_value(_visited, j);
		_current.tile_move_node = true;
		color_move_tiles(_current, _entity_move, _entity_actions);
	}
	
	// Cleanup
	ds_list_destroy(_visited);
}