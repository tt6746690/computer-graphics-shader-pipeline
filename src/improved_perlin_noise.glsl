// Given a 3d position as a seed, compute an even smoother procedural noise
// value. "Improving Noise" [Perlin 2002].
//
// Inputs:
//   st  3D seed
// Values between  -½ and ½ ?
//
// expects: random_direction, improved_smooth_step
float improved_perlin_noise( vec3 st) 
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 

  // reference: 
  //    https://en.wikipedia.org/wiki/Perlin_noise
  //    https://www.scratchapixel.com/lessons/procedural-generation-virtual-worlds/perlin-noise-part-2/perlin-noise

  // unit grid cell coordinates

  float x0 = -1;
  float y0 = -1;
  float z0 = -1;
  float x1 = 1;
  float y1 = 1;
  float z1 = 1;

  vec3 v111 = vec3(x0, y0, z0);
  vec3 v011 = vec3(x1, y0, z0);
  vec3 v101 = vec3(x0, y1, z0);
  vec3 v110 = vec3(x0, y0, z1);
  vec3 v001 = vec3(x1, y1, z0);
  vec3 v010 = vec3(x1, y0, z1);
  vec3 v100 = vec3(x0, y1, z1);
  vec3 v000 = vec3(x1, y1, z1);


  // compute gradient(bounding_box_coord) \cdot distance(st, bounding_box_coord)

  float d000 = dot(random_direction(v000), st - v000);
  float d100 = dot(random_direction(v100), st - v100);
  float d010 = dot(random_direction(v010), st - v010);
  float d001 = dot(random_direction(v001), st - v001);
  float d110 = dot(random_direction(v110), st - v110);
  float d101 = dot(random_direction(v101), st - v101);
  float d011 = dot(random_direction(v011), st - v011);
  float d111 = dot(random_direction(v111), st - v111);

  // linear interpolation 

  float wx = improved_smooth_step(st.x - x0);
  float wy = improved_smooth_step(st.y - y0);
  float wz = improved_smooth_step(st.z - z0);

  float d00 = lerp(d000, d100, wx);
  float d01 = lerp(d001, d101, wx);
  float d10 = lerp(d010, d110, wx);
  float d11 = lerp(d011, d111, wx);
  float d0  = lerp(d00,  d10,  wy);
  float d1  = lerp(d01,  d11,  wy);
  float d   = lerp(d0,   d1,   wz);

  return d * 2 / sqrt(3);
  /////////////////////////////////////////////////////////////////////////////
}

