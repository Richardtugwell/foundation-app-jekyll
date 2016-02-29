var argv        = require('yargs').argv;

// Check for --production flag
//TODO: should be in some kind of ENV implementation
var isProduction = !!(argv.production);

// Browsers to target when prefixing CSS.
var COMPATIBILITY = ['last 2 versions', 'ie >= 9'];

// File paths to various assets are defined here.
var SOURCE = {
    assets: [
        'src/assets/**/*',
        '!src/assets/{scss,js}/**/*.*'
    ],
    scssApp: 'src/assets/scss/app.scss',
    sass: [
        'src/assets/scss',
        'bower_components/foundation-apps/scss'
    ],
    iconic: [
        'bower_components/foundation-apps/iconic/**/*'
    ],
    ngtemplates: [
        'bower_components/foundation-apps/js/angular/components/**/*.html'
    ],
    javascript: [
        'bower_components/fastclick/lib/fastclick.js',
        'bower_components/viewport-units-buggyfill/viewport-units-buggyfill.js',
        'bower_components/tether/tether.js',
        'bower_components/hammerjs/hammer.js',
        'bower_components/angular/angular.js',
        'bower_components/angular-animate/angular-animate.js',
        'bower_components/angular-ui-router/release/angular-ui-router.js',
        'bower_components/foundation-apps/js/vendor/**/*.js',
        'bower_components/foundation-apps/js/angular/**/*.js',
        '!bower_components/foundation-apps/js/angular/app.js',
        'src/assets/js/**/!(app).js',
        'src/assets/js/app.js'
    ]
};

// File paths to WATCH.
var WATCH = {
    assets: [
        'src/assets/**/*',
        '!src/assets/{img,js,scss}/**/*'
    ],
    sass: [
        'src/assets/scss/**/{*.scss, *.sass}'
    ],
    javascript: [
        'src/assets/js/**/*.js'
    ],
    images: [
        'src/assets/img/**/*'
    ],
    jekyll: [
        'src/_*/*',
        '_config.yml'
    ]
}

// File paths to various targets.
var TARGET = {
    assets: 'build/assets',
}

// Config - gets passed to all tasks.
module.exports = {
    isProduction: isProduction,
    PORT: 8079,
    SERVERROOT: './build',
    TASKDIR: './gulp/tasks/',
    COMPATIBILITY: COMPATIBILITY,
    WATCH: WATCH,
    SOURCE: SOURCE,
    TARGET: TARGET
};
