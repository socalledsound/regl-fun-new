  precision mediump float;
  attribute vec2 position;
  uniform mat4 projection;
  

varying vec2 vPos;

  void main () {
    vPos = position;
    gl_Position = projection * vec4(position, 0, 1);
  }