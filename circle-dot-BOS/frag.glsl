#ifdef GL_ES
precision mediump float;
#endif

uniform float u_resolution;
uniform float u_time;
varying vec2 vPos;

float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.5);
	return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*4.0);
}

float flowerSDF(vec2 st) {
    st = st*2.-1.;
    float r = length(st)*2.;
    float a = atan(st.y,st.x);
    float v = float(3)*.5;
    return 1.-(abs(cos(a*v))*.5+.5)/r;
}



void main(){
	vec2 st = vPos * 4.0;
	vec2 flowerOutput = flower(vPos);
	vec3 color = vec3(circle(abs(st),0.9));
	// vec3 color = vec3(flower(st, 3.0),0);

	gl_FragColor = vec4( color, 1.0 );
}
