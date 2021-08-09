/// @description 在此处插入描述 
// 你可以在此编辑器中写入代码
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);

draw_set_font(pixel_font);
draw_text_colour(cx + cw/2 - title_width/2*5, cy + title_height, title, c_purple, c_purple, c_yellow, c_yellow, 1);
