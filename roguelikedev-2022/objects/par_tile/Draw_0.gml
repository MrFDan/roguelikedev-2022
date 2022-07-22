if (tile_explored)
{
	draw_self();
}

if (global.debug_mode)
{
	draw_text(x, y, string(ds_list_size(neighbors)));
}