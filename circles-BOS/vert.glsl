  precision mediump float;
  attribute vec2 position;
  uniform float u_resolution;

varying vec2 vPos;

  void main () {
    vPos = position;
    gl_Position = vec4(position, 0, 1);
  }