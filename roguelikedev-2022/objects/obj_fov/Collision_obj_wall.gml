if (!collision_line(other.x, other.y, global.player.x, global.player.y, obj_wall, false, false))
{
	other.tile_dark = false;
	other.tile_explored = true;
}