// TEMP
draw_set_font(fDefault);
draw_set_color(c_black);
draw_text(camera_x + 7, camera_y + 8, "TURN: " + string(global.turn_count) + "  MP: " + string(global.player.movement_points));
draw_text(camera_x + 9, camera_y + 8, "TURN: " + string(global.turn_count) + "  MP: " + string(global.player.movement_points));
draw_text(camera_x + 8, camera_y + 7, "TURN: " + string(global.turn_count) + "  MP: " + string(global.player.movement_points));
draw_text(camera_x + 8, camera_y + 9, "TURN: " + string(global.turn_count) + "  MP: " + string(global.player.movement_points));
draw_set_color(c_white);
draw_text(camera_x + 8, camera_y + 8, "TURN: " + string(global.turn_count) + "  MP: " + string(global.player.movement_points));