  
  precision mediump float;
  varying vec2 uv;
  uniform vec2 iResolution;
void main()
{
	 vec2 u = 8. * uv/iResolution.x;
    //  vec2 u = 8. * uv;
    
    vec2 s = vec2(1.,1.732);
    vec2 a = mod(u     ,s)*2.-s;
    vec2 b = mod(u+s*.5,s)*2.-s;
    
	//gl_FragColor = vec4(.5* min( dot(a,a), dot(b,b) ));
    gl_FragColor = vec4(.5* min( dot(a,a), dot(b,b) ), .9* min( dot(a,a), dot(b,b) ), .5* min( dot(a,a), dot(b,b) ), 0.7);
}