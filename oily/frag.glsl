  
#define D   length( mod( mult += T/2. , T ) - R )               //
#define P   clamp( 1.- ( min( D, D ) -.8*R.y )/5. ,0.,1.)    // draw an hexa tiling of disks
  
  precision mediump float;
  varying vec2 uv;
  uniform float u_time;
  uniform vec2 iResolution;
 


void main() {

    vec2 R = iResolution.xy/8.;
    vec2 T = vec2(2.0, 3.5) * R;

    // vec2 U = uv/iResolution.xy;
    vec2 mult =uv/iResolution.xy * iResolution.xy;



    mult *= 6.5;
    
    float len;
    for(int i = 0; i < 3; i++) {
        len = length(mult);
        mult.x +=  sin(mult.y + u_time/10. * 0.8) * 2.8;
        mult.y +=  cos(mult.x + u_time/10. * 0.01 + cos(len * 2.0))*2.;
    }
    
    vec3 col = vec3(len += P - len, len += P -len , len += P -len);
    vec3 pcol = vec3(col.r * P, col.g*P, col.b*P);
    
    gl_FragColor = vec4(col,0.8);
}