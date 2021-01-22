const regl = require('regl')();
const glslify = require('glslify');


const mouse = require('mouse-event');
const audioPlayer = require('web-audio-player')
const src = './microphone/assets/ss1-2.mp3'
const AudioContext = window.AudioContext || window.webkitAudioContext
let analyser, fftSize, fftBuffer, frequencies;
 window.addEventListener('click', ()=> start());