precision mediump float;

attribute vec3 position, normal;
uniform mat4 projectionView, model;
varying vec3 v_normal;
// uniform float u_time;

void main(){
    v_normal = normal;
    vec3 position3 = position;
    // position2.y += u_time;
    position3.y -= 5.0;
    gl_Position = projectionView * model * vec4(position3 * 0.2, 1.0);
}