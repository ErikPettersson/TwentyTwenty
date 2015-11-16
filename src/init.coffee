# Require configuration
requirejs.config

  baseUrl: './'

  paths:
    jquery: 'lib/jquery/dist/jquery'
    lodash: 'lib/lodash/dist/lodash'
    ractive: 'lib/ractive/ractive'

    TweenLite: 'lib/gsap/src/uncompressed/TweenLite'
    CSSPlugin: 'lib/gsap/src/uncompressed/plugins/CSSPlugin'
    EasePack: 'lib/gsap/src/uncompressed/easing/EasePack'

  deps: [
    'jquery'
  ]


# Entry point
require ['jquery', 'app', 'TweenLite', 'CSSPlugin', 'EasePack'], ($, app) ->
  new app($('body'))