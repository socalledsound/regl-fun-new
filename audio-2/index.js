
const regl = require('regl')()
// const resl = require('resl')({
//   manifest: {
//     'song': {
//       type: 'audio',
//       stream: true,
//       src: './microphone/assets/4.mp3'
//     }
//   },
//   onDone : (assets) => {
//     start(assets.song);
//   }
// })
const mouse = require('mouse-event');

const audioPlayer = require('web-audio-player')
const src = '/microphone/assets/ss1-2.mp3'
const AudioContext = window.AudioContext || window.webkitAudioContext
let analyser, fftSize, fftBuffer, frequencies;

window.addEventListener('click', ()=> start())


// start()

function start () {
//   if (supportedTextures < 1) {
//     return error('This demo requires a GPU with vertex texture sampling.')
//   }
  if (!AudioContext) {
    return error('This demo requires a WebAudio capable browser.')
  }
//   if (isMobile()) {
//     return desktopOnly()
//   }
  
  const audioContext = new AudioContext()
  const audio = audioPlayer(src, {
    context: audioContext,
    loop: true,
    buffer: false,
    volume: 0.5,
  })
  // const loader = document.querySelector('.loader')
  audio.once('load', () => {
    // analyser = glAudioAnalyser(gl, audio.node, audioContext)
    analyser = audioContext.createAnalyser()
    audio.play()
    audio.node.connect(analyser);
     audio.node.connect(audioContext.destination);
    fftSize = analyser.frequencyBinCount
    frequencies = new Uint8Array(fftSize)
    fftBuffer = regl.buffer({
      length: fftSize,
      type: 'uint8',
      usage: 'dynamic'
    })
    const drawSpectrum = regl({
      vert: `
      precision mediump float;
  
      #define FFT_SIZE ${fftSize}
      #define PI ${Math.PI}
  
      attribute float index, frequency;
      varying vec2 vuv;
      void main() {
        float theta = 2.0 * PI * index / float(FFT_SIZE);
        float x = 0.25 * cos(theta) * (1.0 + frequency);
        float y = 0.5 * sin(theta) * (1.0 + frequency);
        vuv = vec2(x, y);
        
        gl_Position = vec4(
          x,
          y,
          0,
          1);
      }`,
  
      frag: `
      precision mediump float;
      varying vec2 vuv;

      void main() {

        float x = vuv.x;

        gl_FragColor = vec4(1.0 * x , 1, 1.0 / vuv.y, 1);
      }`,
  
      attributes: {
        index: Array(fftSize).fill().map((_, i) => i),
        frequency: {
          buffer: fftBuffer,
          normalized: true
        }
      },
      elements: null,
      instances: -1,
      lineWidth: 1,
      depth: {enable: false},
      count: fftSize,
      primitive: 'line loop'
    })
  
    regl.frame(({tick}) => {
      // Clear draw buffer
      regl.clear({
        color: [0, 0, 0, 1],
        depth: 1
      })
  
      // Poll microphone data
      analyser.getByteFrequencyData(frequencies)
  
      // Here we use .subdata() to update the buffer in place
      fftBuffer.subdata(frequencies)
  
      // Draw the spectrum
      drawSpectrum()
    })
  })
}

// First we need to get permission to use the microphone
// require('getusermedia')({audio: true}, function (err, stream) {
//   if (err) {
//     console.log(err);
   
//   } else {
//     console.log('streaming', stream)
//   }

  // Next we create an analyser node to intercept data from the mic
  // const context = new AudioContext()
  

  // And then we connect them together
  // context.createMediaStreamSource(stream).connect(analyser)

  // Here we preallocate buffers for streaming audio data


  // This command draws the spectrogram
 

