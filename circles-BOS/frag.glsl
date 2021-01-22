#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif
  
  precision mediump float;
  uniform vec4 u_color;
  uniform float u_time;
  uniform float u_resolution;
  varying vec2 vPos;


float circle(vec2 pt, vec2 center, float radius){
  vec2 p = pt - center;
  return 1.0 - step(radius, length(p));
}

// float random(float x){
//   return sin(x) * 1000000
// }

	vec3 hexToCell(vec3 hex, float m) {
		return fract(hex / m) * 2.0 - 1.0;
	}

  void main () {
    // float circleCount = 1.0;

    // // float r = random(0.25);
    // float r  = 0.25;
    // // vec2 p = fract(vPos * u_resolution * circleCount);
    // vec2 p = vPos;
    // // vec2 circle = circle(p, vec2(0.5), r);
    // // vec3 hex = hexToCell(vec3(circle,0.0), 0.4);
    // // float inCircle = 1.0 - step(0.5,length(vPos));
    // // vec3 circleColor = vec3(0.2,0.5,0.2) * inCircle;
    // vec3 circleColor = vec3(0.7, 0.2, 0.6) * circle(p, vec2(0.0), r);
    // // vec3 hex = hexToCell(circleColor, 0.3);
    // gl_FragColor = vec4(circleColor, 1.0);





     vec2 st = vPos;
    //  st*= (u_resolution * 8.0 + st)/8.0;
  // st.x *= u_resolution.x/u_resolution.y;
  vec3 color = vec3(0.0);
  float d = 0.0;

  // Remap the space to -1. to 1.
  // st = st *2.-1.;

  // Make the distance field
  d = length( abs(st) - 0.6 );
  //d = length(st);
  // d = length( min(abs(st)-.3,0.) );
  // d = length( max(abs(st)-.3,0.) );

  // Visualize the distance field
  gl_FragColor = vec4(vec3(fract(d * 10.0)),1.0);

  // Drawing with the distance field
  gl_FragColor = vec4(vec3( step(.3, d) ),1.0);
   gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
  //gl_FragColor = vec4(vec3( smoothstep(.3,.4,d)* smoothstep(.6,.5,d)) ,1.0);
  }