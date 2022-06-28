// Keyboard controls

key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

// Control the turns
switch (global.turn)
{
	case TURN_ORDER.PLAYER:
		
		// Player movement
		with (global.player)
		{
			if (other.key_right) MoveOnGrid(1, 0);
			if (other.key_left) MoveOnGrid(-1, 0);
			if (other.key_up) MoveOnGrid(0, -1);
			if (other.key_down) MoveOnGrid(0, 1);
		}
		
	break;
	
	case TURN_ORDER.ENEMY:
	
	break;
}