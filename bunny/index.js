const regl = require('regl')();
const glslify = require('glslify');
const bunny = require('bunny');
const createCamera = require('perspective-camera');
const angleNormals = require('angle-normals');
const mat4 = require('gl-mat4');


const camera = createCamera({
    fov: Math.PI/4,
    near: 0.01,
    far: 100,
    viewport: [0,0, window.innerWidth, window.innerHeight]
})

camera.translate([0,0,-6]);
camera.lookAt([0,0,0]);
camera.update();
console.log(camera.projView);


const draw = regl({
    vert: glslify('./vert.glsl'),
    frag: glslify('./frag.glsl'),
    attributes: {
        position: bunny.positions,
        normal: angleNormals(bunny.cells, bunny.positions),
    },
    uniforms : {
        // u_time: ({time}) => time
        projectionView: camera.projView,
        model: ({time}) => mat4.rotateY([], mat4.identity([]), time)
    },
    elements: bunny.cells
})


const loop = regl.frame(() => {
    try { 
        regl.clear({
            color: [0,0,0,1]
        })
        draw();
    } catch(error){
        loop.cancel()
        throw error
    }
})