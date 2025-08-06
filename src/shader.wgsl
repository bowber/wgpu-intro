
@vertex
fn vs_main(@builtin(vertex_index) vertexIndex: u32) -> @builtin(position) vec4f {
    let pos = array(
        // First triangle
        vec2f(-0.5, 0.5),  // top left
        vec2f(0.5, 0.5),   // top right
        vec2f(-0.5, -0.5),  // bottom left
        // Next triangle
        vec2f(0.5, -0.5),  // bottom right
        vec2f(-0.5, -0.5),  // bottom left
        vec2f(0.5, 0.5)    // top right
    );
    return vec4f(pos[vertexIndex], 0.0, 1.0);
}

@fragment
fn fs_main(@builtin(position) pos: vec4f) -> @location(0) vec4f {
    let screen_height = 1347.0; 
    // Simple coloring: top half red, bottom half blue
    if pos.y < screen_height / 2.0 {
        return vec4f(1.0, 0.0, 0.0, 1.0); // red
    } else {
        return vec4f(0.0, 0.0, 1.0, 1.0); // blue
    }
}
