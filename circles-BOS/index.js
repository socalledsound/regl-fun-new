const regl = require('regl')();
const glslify = require('glslify');


const bgCol = [Math.random(), Math.random(), Math.random(), 1.0];
const triangleCol = [Math.random(), Math.random(), Math.random(), 1.0];





const drawCircle = regl({
    frag: glslify('./frag.glsl'),
    vert: glslify('./vert.glsl'),

attributes: {
    position: [[-1,-1], [1, -1], [1, 1],[-1,1]]
},

uniforms: {
    u_time: (context) => context.time,
    u_color: bgCol,
    u_resolution: window.innerWidth/window.innerHeight,
},

count: 4,
primitive: "triangle fan",
})




const loop = regl.frame(() => {
    try { 
        regl.clear({
            color: [0,0,0,1]
        })
        drawCircle();
    } catch(error){
        loop.cancel()
        throw error
    }
})















