if (!collision_line(other.x, other.y, global.player.x, global.player.y, obj_wall, false, true))
{
	other.entity_visible = true;
}