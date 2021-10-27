#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif
// #define D  length( mod( U += T/2. , T ) - R )             //
  precision mediump float;
  uniform vec4 u_color;
  uniform float u_time;
  uniform vec2 iResolution;
  varying vec2 vPos;


void main() {
    //gl_FragColor = vec4(0.0,1.0,0.0,1.0);
    //  vec2 smaller = vPos*10.0;
    //vec4 myColor = vec4(0.0,1.0,0.0,1.0);
    //gl_FragColor = vec4(bool(mod(length(vec2(vPos/iResolution.xy*2.-1.) * vec2(iResolution.x/iResolution.y,1.)) - u_time/5., .1) > 0.9));
    //gl_FragColor = vec4(bool(mod(length(vec2(vPos/iResolution.xy*2.-1.) * vec2(iResolution.x/iResolution.y,1.))) > 0.5)) 
    //gl_FragColor = vec4(bool(mod(length(vec2(vPos/iResolution.xy*2.-1.) * vec2(iResolution.x/iResolution.y, 1.)), 0.1) > 3.0));
    // gl_FragColor = vec4(bool(mod(length(vec2(vPos/iResolution.xy*2.-1.) * vec2(iResolution.x/iResolution.y, 1.)) - u_time, 0.1) > 0.9));
    vec4 O = vec4(1.0);
    gl_FragColor = O;

}

 // gl_FragColor = vec4(bool(mod(length(myColor)) > 0.5));

// void main () {
//     vec2 R = iResolution.yy/8., T = vec2( 2, 3.5 )*R, U=vPos;
//     O += 1.- .5* abs( min( D, D ) -R.y );
//     gl_FragColor = vec4(O, 1.0);
// }
