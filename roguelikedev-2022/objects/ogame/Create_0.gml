// Initialize the Player
global.player = instance_create_layer(0, 0, "Instances", oPlayer);

with (global.player)
{
	grid_x = 40;
	grid_y = 25;
}

// Initialize game variables
global.turn = TURN_ORDER.PLAYER;