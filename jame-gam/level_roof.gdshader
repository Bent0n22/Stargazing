shader_type canvas_item;

// The noise texture used to drive transparency (Set to 'Seamless' in inspector!)
uniform sampler2D noise_texture : repeat_enable;

// How fast the noise moves along the X and Y axes
uniform vec2 scroll_speed = vec2(0.1, 0.05);

// Overall strength of the transparency (0.0 = completely invisible, 1.0 = fully uses texture)
uniform float alpha_multiplier : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    // 1. Calculate the moving offset using Godot's built-in TIME variable
    vec2 moving_uv = UV + (scroll_speed * TIME);
    
    // 2. Sample the red channel of the noise texture at the moving coordinates
    float noise_value = texture(noise_texture, moving_uv).r;
    
    // 3. Get the original texture's color and alpha
    vec4 tex_color = texture(TEXTURE, UV);
    
    // 4. Multiply the texture's original alpha by the noise value and our multiplier
    tex_color.a *= noise_value * alpha_multiplier;
    
    // 5. Output the final color
    COLOR = tex_color;
}