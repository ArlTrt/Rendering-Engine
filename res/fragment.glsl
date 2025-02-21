#version 410

out vec4 out_color;
in vec3 vertex_position;

void main()
{
    //out_color = vec4(0.2, 0.8, 0.4, 1.);
    out_color = vec4(vertex_position, 1.);
}