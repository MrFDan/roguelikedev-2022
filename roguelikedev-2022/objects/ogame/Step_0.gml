// Keyboard controls

key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
key_end_turn = keyboard_check_pressed(vk_enter);

// Control the turns
switch (global.turn_phase)
{
	
	case TURN_ORDER.TURN_START:
		if (instance_exists(global.player))
		{
			with (global.player)
			{
				movement_points = max_movement_points;
			}
		}
		global.turn_phase = TURN_ORDER.PLAYER_MOVEMENT;
	break;
	
	case TURN_ORDER.PLAYER_MOVEMENT:
		if (instance_exists(global.player))
		{
			with (global.player)
			{
				if (other.key_right) MoveOnGrid(1, 0);
				if (other.key_left) MoveOnGrid(-1, 0);
				if (other.key_up) MoveOnGrid(0, -1);
				if (other.key_down) MoveOnGrid(0, 1);
				if (other.key_end_turn) global.turn_phase = TURN_ORDER.TURN_END;
			}
		}
	break;

	case TURN_ORDER.TURN_END:
		global.turn_count++;
		global.turn_phase = TURN_ORDER.TURN_START;
	break;
}