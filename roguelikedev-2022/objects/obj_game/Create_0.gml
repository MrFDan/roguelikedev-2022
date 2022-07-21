// Dungeon generation
global.rooms = [];
global.num_rooms = 0;

randomize();

max_rooms = 30;
room_min_size = 6;
room_max_size = 10;

global.entities = []; // Array to store all actors in the game

make_map(max_rooms, room_min_size, room_max_size, GRID_WIDTH, GRID_HEIGHT);