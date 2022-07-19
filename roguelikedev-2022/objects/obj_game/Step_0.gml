// Keyboard controls

key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

// Move the player
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