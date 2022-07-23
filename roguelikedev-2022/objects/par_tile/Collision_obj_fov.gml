if (!collision_line(x + 5, y + 5, global.player.x + 5, global.player.y + 5, obj_wall, true, true))
{
	tile_dark = false;
	tile_explored = true;
}