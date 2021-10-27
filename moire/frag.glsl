// variant of https://shadertoy.com/view/WltBzM
// adapted from https://shadertoy.com/view/ttd3D7

#define D   length( mod( mult += T/2. , T ) - R )               //
#define P   clamp( 1.- ( min( D, D ) -.8*R.y )/5. ,0.,1.)    // draw an hexa tiling of disks

// void mainImage(out vec4 O, vec2 U) {
//     U *= 3.;
//     vec2 R = iResolution.yy/8., T = vec2( 2, 3.5 )*R;
//     O += P -O;

//     U = 1.1*U.yx + 10.*iTime;
//     O *= P;
// }


  precision mediump float;
  varying vec2 uv;
  uniform float u_time;
  uniform vec2 iResolution;
  uniform vec4 O;  

//   uniform vec4 color;
  void main () {
    vec2 mult = uv * 3.0 * iResolution.xy;
    // mult*=iResolution.xy;
    //vec2 R = iResolution.xy/8., T = vec2( 2., 3.5) * R;
    vec2 R = iResolution.xy/8.;
    vec2 T = vec2(2.0, 3.5) * R;
    // vec2 T = vec2( 2., 3.5) * R;
    vec4 bg = O;
     bg += P -bg;
    mult = 1.1 * mult.yx + 10.0 * u_time;  
    // gl_FragColor = vec4(0.5, 0.5, 0.5,1.0);
    gl_FragColor = bg;
  }