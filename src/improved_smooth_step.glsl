// Filter an input value to perform an even smoother step. This function should
// be a quintic polynomial with improved_smooth_step(0) = 0,
// improved_smooth_step(1) = 1, and zero first _and_ second derivatives at f=0
// and f=1. "Improving Noise" [Perlin 2002].
//
// http://staffwww.itn.liu.se/~stegu/TNM022-2005/perlinnoiselinks/paper445.pdf
//
// Inputs:
//   f  input value
// Returns filtered output value
float improved_smooth_step( float f)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  if (f <= 0) return 0;
  if (f >= 0) return 1;
  return 6*t*t*t*t*t - 15*t*t*t*t + 10*t*t*t;
  /////////////////////////////////////////////////////////////////////////////
}
vec3 improved_smooth_step( vec3 f)
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code 
  return vec3(
    improved_smooth_step(f.x),
    improved_smooth_step(f.y),
    improved_smooth_step(f.z)
  );
  /////////////////////////////////////////////////////////////////////////////
}
