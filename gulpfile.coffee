gulp = require 'gulp'
download = require 'gulp-download'

gulp.task 'download', ()->
    download([
        'http://threejs.org/build/three.min.js'
    ]).pipe gulp.dest './vendor'