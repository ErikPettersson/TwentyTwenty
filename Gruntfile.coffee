module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  outdir = "out"

  # Project configuration.
  grunt.initConfig(

    pkg: grunt.file.readJSON('package.json')


    clean:
      all:
        files: [
          { dot: true, src: ['cordova/www'] }
        ]


    copy:
      assets:
        files: [ { expand: true, cwd: 'src', src: ['**/*.{ico,jpg,svg,png,gif,html,css,mp4,eot,svg,ttf,woff}'], dest: outdir } ]

      bower:
        files: [ { expand: true, cwd: 'bower_components', src: ['**/*.{js,coffee,map,css}'], dest: outdir + '/lib' } ]

      static_js:
        files: [ { expand: true, cwd: 'src', src: ['**/*.js'], dest: outdir } ]

      html:
        files: [ { expand: true, cwd: 'src', src: ['**/*.html'], dest: outdir } ]


    coffee:
      options: sourceMap: true
      compile: { expand: true, flatten: false, cwd: 'src', src: ['**/*.coffee'], dest: outdir, ext: '.js' }


    coffeelint:
      options: configFile: 'coffeelint.json'
      src: ['src/**/*.coffee']


    watch:
      assets:
        files: ['src/assets/*']
        tasks: ['copy:assets']

      coffee:
        files: ['src/**/*.coffee']
        tasks: ['coffeelint', 'coffee:compile']

      html:
        files: ['src/**/*.html']
        tasks: ['copy:assets']
  )


  # Default task(s).
  grunt.registerTask('default', ['clean', 'coffeelint', 'coffee', 'copy'])

  grunt.registerTask('dev', ['default', 'watch'])
