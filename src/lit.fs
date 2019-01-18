// Add (hard code) an orbiting (point or directional) light to the scene. Light
// the scene using the Blinn-Phong Lighting Model.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in; 
in vec4 view_pos_fs_in; 
// Outputs:
out vec3 color;
// expects: PI, blinn_phong
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 

  // view direction `v` of a vertex in camera space
  //    is the opposite of vector encoding its position (origin is the camera)
  vec3 v = -normalize(vec3(view_pos_fs_in.xyz / view_pos_fs_in.w));

  // Let light rotate with a period of 8s
  //    the light direction for each vertex `l` is the difference of
  //    light position and vertex position
  vec4 light = vec4(vec3(10,10,10),1);
  mat4 light_model = inverse(rotate_about_y(0.5 * mod(animation_seconds, 4.0) * M_PI));
  light = view * light_model * light;
  vec3 l = normalize(vec3(light - view_pos_fs_in));

  // normal direction is computed previously during tesselation evaluation
  vec3 n = normalize(normal_fs_in);

  // specify colors for moon and earth
  vec3 kd;
  vec3 ka = vec3(0,0,0);
  vec3 ks = vec3(1,1,1);

  if (is_moon) {
    kd = vec3(0.5,0.5,0.5); // gray
  } else {
    kd = vec3(0,0,1); // blue 
  }

  color = blinn_phong(ka, kd, ks, 200, n, v, l);

  /////////////////////////////////////////////////////////////////////////////
}
