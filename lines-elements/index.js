/*
  tags: basic, lines
<p> This example demonstrates how you can use `elements` to draw lines. </p>
 */

const regl = require('regl')()

regl.clear({
  color: [0, 0, 0, 1],
  depth: 1
})

var lineWidth = 1 ;
if (lineWidth > regl.limits.lineWidthDims[1]) {
  lineWidth = regl.limits.lineWidthDims[1]
}


const elements = Array.from({length: 200}, (el) => [Math.random() * 4, Math.random() * 4]);



regl({
  frag: `
    precision mediump float;
    uniform vec4 color;
    void main() {
      gl_FragColor = color;
    }`,

  vert: `
    precision mediump float;
    attribute vec2 position;
    void main() {
      gl_Position = vec4(position, 0, 1);
    }`,

  attributes: {
    position: (new Array(5)).fill().map((x, i) => {
      var theta = 2.0 * Math.PI * i / 5
      return [ Math.sin(theta), Math.cos(theta) ]
    })
  },

  uniforms: {
    color: [1, 0, 0, 1]
  },

  elements: elements,

  lineWidth: 1
})()