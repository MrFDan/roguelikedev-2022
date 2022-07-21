// Floors
if (!collision_line(other.x, other.y, global.player.x+5, global.player.y+5, obj_wall, false, true))
{
	other.tile_dark = false;
}