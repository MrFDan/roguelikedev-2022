// Keyboard controls
key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

// Turns
switch (global.game_state)
{
	case GAME_STATE.PLAYERS_TURN:
		if (instance_exists(global.player))
		{
			with (global.player)
			{
				if (other.key_right) move_on_grid(1, 0);
				if (other.key_left) move_on_grid(-1, 0);
				if (other.key_up) move_on_grid(0, -1);
				if (other.key_down) move_on_grid(0, 1);
			}
		}
	break;

	case GAME_STATE.ENEMY_TURN:
		for (var m = 0; m < array_length_1d(global.entities); m++)
		{
			if (m != global.player && global.entities[m].entity_turn_script != -1)
			{
				with (global.entities[m]) script_execute(entity_turn_script);
			}
		}
	
		global.game_state = GAME_STATE.PLAYERS_TURN;
		
	break;
}