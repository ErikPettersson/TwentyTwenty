define (require) ->

  Ractive = require('ractive')
  Controller = require('Controller')
  TweenLite = require('TweenLite')

  class App extends Controller

    constructor: (el) ->
      TweenLite.set(el, {alpha: 0})

      @view = new Ractive(
        el: el,
        template: "Hello world"
      )

      TweenLite.to(el, .5, {alpha: 1})

