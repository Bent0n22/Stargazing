shader_type canvas_item;

// Allows you to control the blur amount from the Inspector or via code
uniform float blur_amount : hint_range(0.0, 5.0) = 2.5;

// Godot 4 screen texture capture
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    // Samples what is behind the ColorRect at the specified LOD (level of detail) blur
    COLOR = textureLod(SCREEN_TEXTURE, SCREEN_UV, blur_amount);
}
