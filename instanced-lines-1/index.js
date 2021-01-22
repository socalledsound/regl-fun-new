const regl = require('regl')();
const glslify = require('glslify');
const { mat4 } = require("gl-matrix");

const projection = mat4.ortho(
    mat4.create(),
    -window.innerWidth / 2,
    window.innerWidthh / 2,
    -window.innerHeight/ 2,
    window.innerHeight / 2,
    0,
    -1
  );

  const viewport =  { x: 0, y: 0, width: window.innerWidthth, height: window.innerHeight };

const bgCol = [Math.random(), Math.random(), Math.random(), 1.0];
const triangleCol = [Math.random(), Math.random(), Math.random(), 1.0];


const drawLines = regl({
    frag: glslify('./frag.glsl'),
    vert: glslify('./vert.glsl'),

attributes: {
    position: regl.prop('position'),
},

uniforms: {
   color: regl.prop('color'),
   projection: regl.prop('projection'),
},

primitive: "lines",
lineWidth: 1,
count: regl.prop('count'),
viewport: regl.prop('viewport'),
})

function generateSamplePointsInterleaved(width, height) {
    const stepx = width / 9;
    const stepy = height / 3;
    const points = [];
    for (let x = 1; x < 9; x += 2) {
      points.push([(x + 0) * stepx - width / 2, 1 * stepy - height / 2]);
      points.push([(x + 1) * stepx - width / 2, 2 * stepy - height / 2]);
    }
    return points;
  }

const vertexData = generateSamplePointsInterleaved(window.innerWidth, window.innerHeight);

const buffer = regl.buffer({data: vertexData});

const loop = regl.frame((context) => {
    console.log(buffer);
    try { 
        regl.clear({
            color: [0,0,0,1]
        })
        drawLines({
            position: buffer,
            count: vertexData.length,
            width: regl.limits.lineWidthDims[1],
            color: [0, 1, 0, 1],
            projection,
            viewport
        });
    } catch(error){
        loop.cancel()
        throw error
    }
})















