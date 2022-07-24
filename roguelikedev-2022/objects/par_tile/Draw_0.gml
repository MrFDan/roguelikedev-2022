if (tile_explored)
{
	draw_sprite_ext(sprite_index, tile_dark, x, y, 1, 1, 0, tile_color, image_alpha);
}

if (global.debug_mode)
{
	draw_text(x, y, string(tile_g_score));
}