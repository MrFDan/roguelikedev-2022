function make_map(_max_rooms, _room_min_size, _room_max_size, _map_width, _map_height)
{
	// Flood the map with wall tiles
	for (var i = 0; i < GRID_WIDTH; i++)
	{
		for (var j = 0; j < GRID_HEIGHT; j++)
		{
			global.game_map[i, j] = instance_create_layer(i*TILE_SIZE, j*TILE_SIZE, "Tiles", obj_wall);
		}
	}
	
	// Make rooms and tunnels
	for (var r = 0; r < _max_rooms; r++)
	{
		// Random width and height
		var _w = irandom_range(_room_min_size, _room_max_size);
		var _h = irandom_range(_room_min_size, _room_max_size);
		
		// Random position without going outside of the boundaries of the map
		var _grid_x = irandom_range(0, _map_width - _w - 1);
		var _grid_y = irandom_range(0, _map_height - _h - 1);
		
		var _new_room = create_room(_grid_x, _grid_y, _w, _h);
		
		// Run through the other rooms and see if they intersect with this one
		for (var other_room = 0; other_room < array_length(global.rooms); other_room++) {
			if intersect(_new_room, global.rooms[other_room])
			{
				instance_destroy(_new_room);
				break;
			}
		}
		
		// This means there are no intersections, so this room is valid
		with (_new_room)
		{
			create_floor();
			
			if (global.num_rooms == 0)
			{
				// This is the first room, where the player starts at
				// Create player
				global.player = instance_create_layer(0, 0, "Entities", obj_player);
				array_push(global.entities, global.player);

				with (global.player)
				{
					grid_x = other.center_grid_x;
					grid_y = other.center_grid_y;
				}
			}
			else
			{
				// All rooms after the first:
				// Connect it to the previous room with a tunnel
				if (irandom_range(0, 1) == 1)
				{
					// First move horizontally, then vertically
					var _prev_room = global.rooms[global.num_rooms - 1];
					create_h_tunnel(_prev_room.center_grid_x, center_grid_x, _prev_room.center_grid_y);
					create_v_tunnel(_prev_room.center_grid_y, center_grid_y, center_grid_x);
				}
				else
				{
					// First move vertically, then horizontally
					var _prev_room = global.rooms[global.num_rooms - 1];
					create_v_tunnel(_prev_room.center_grid_y, center_grid_y, _prev_room.center_grid_x);
					create_h_tunnel(_prev_room.center_grid_x, center_grid_x, center_grid_y);
				}
				
				place_entities(_new_room);
			}

			array_push(global.rooms, _new_room);
			global.num_rooms++;
		}
	}
}

function create_room(_grid_x, _grid_y, _width, _height)
{
	var _new_room = instance_create_layer(_grid_x*TILE_SIZE, _grid_y*TILE_SIZE, "Tiles", obj_rectangular_room);
	
	with (_new_room)
	{
		grid_x1 = _grid_x;
		grid_y1 = _grid_y;
		grid_x2 = grid_x1 + _width;
		grid_y2 = grid_y1 + _height;
		
		center_grid_x = floor((grid_x1 + grid_x2) / 2);
		center_grid_y = floor((grid_y1 + grid_y2) / 2);
	}
	
	return _new_room.id;
}

function create_h_tunnel(_grid_x1, _grid_x2, _grid_y)
{
	for (var i = min(_grid_x1, _grid_x2); i < max(_grid_x1, _grid_x2) + 1; i++)
	{
		with (global.game_map[i, _grid_y]) instance_change(obj_floor, true);
	}
}

function create_v_tunnel(_grid_y1, _grid_y2, _grid_x)
{
	for (var i = min(_grid_y1, _grid_y2); i < max(_grid_y1, _grid_y2) + 1; i++)
	{
		with (global.game_map[_grid_x, i]) instance_change(obj_floor, true);
	}
}

function intersect(_id1, _id2)
{
	return (_id1.grid_x1 <= _id2.grid_x2 and _id1.grid_x2 >= _id2.grid_x1 and _id1.grid_y1 <= _id2.grid_y2 and _id1.grid_y2 >= _id2.grid_y1);
}

function create_floor()
{
	for (var i = grid_x1 + 1; i < grid_x2; i++)
	{
		for (var j = grid_y1 + 1; j < grid_y2; j++)
		{
			with (global.game_map[i, j]) instance_change(obj_floor, true);
		}
	}
}

function place_entities(_room)
{
	// Get a random number of monsters
	number_of_monsters = irandom_range(0, MAX_MONSTERS_PER_ROOM);
	for (var i = 0; i < number_of_monsters; i++)
	{
		// Choose a random location in the room
		var _grid_x = irandom_range(_room.grid_x1 + 1, _room.grid_x2 - 1);
		var _grid_y = irandom_range(_room.grid_y1 + 1, _room.grid_y2 - 1);
		var _monster = instance_create_layer(_grid_x * TILE_SIZE, _grid_y * TILE_SIZE, "Entities", par_entity);
		
		for (var m = 0; m < array_length_1d(global.entities); m++)
		{
			if (_grid_x == global.entities[m].grid_x and _grid_y == global.entities[m].grid_y)
			{
				instance_destroy(_monster);
				break; // There already is another entity on that position
			}
			else
			{
				if (irandom_range(0, 100) < 80)
				{
					with (_monster) instance_change(obj_orc, true);
				}
				else
				{
					with (_monster) instance_change(obj_troll, true);
				}
				
				with (_monster)
				{
					grid_x = _grid_x;
					grid_y = _grid_y;
				}
			}
		}
		
		array_push(global.entities, _monster);
	}
}