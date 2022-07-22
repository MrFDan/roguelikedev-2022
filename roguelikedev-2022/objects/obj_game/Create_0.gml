enum GAME_STATE
{
	PLAYERS_TURN,
	ENEMY_TURN
}

randomize();

global.game_state = GAME_STATE.PLAYERS_TURN

// Dungeon generation
global.entities = []; // Array to store all actors in the game
global.rooms = [];
global.num_rooms = 0;
max_rooms = 30;
room_min_size = 6;
room_max_size = 10;

make_map(max_rooms, room_min_size, room_max_size, GRID_WIDTH, GRID_HEIGHT);