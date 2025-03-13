#version 410

out vec4 out_color;
//out vec4 out_render_color;
in vec3 vertex_position;
in vec2 uv;
in vec3 normal;
uniform sampler2D my_texture;
uniform vec3 directional_light;
uniform vec3 point_light;
const float intensity= 10;

void main()
{
    //out_color = vec4(0.2, 0.8, 0.4, 1.);
    //out_color = vec4(vertex_position, 1.);
    //out_color = vec4(uv.x, uv.y, 0., 1.);
    vec3 direction_point_light = (point_light - vertex_position);
    float distance_squared = dot(direction_point_light, direction_point_light);
    vec4 texture_color = texture(my_texture, uv);
    vec4 texture_light = texture_color * (clamp(intensity *(dot(vertex_position, normalize(direction_point_light)) / distance_squared), 0., 1.)+0.3);
    out_color = texture_light * vec4(0,texture_color.g, 0, 1);


    //out_color = vec4(normal.x, normal.y, normal.z, 1.0f);
}
