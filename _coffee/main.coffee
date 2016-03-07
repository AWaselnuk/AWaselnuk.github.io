'use strict'

# DOM Ready
ready = (fn) ->
  if document.readyState != 'loading'
    fn()
  else
    document.addEventListener 'DOMContentLoaded', fn

# Detect mobile browser
mobileBrowser = window.innerWidth <= 800

# Returns a random integer between min (included) and max (excluded)
getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min)) + min

# A collection of themes with a cover image and color
themes = [
  {image: 'tree.jpg', color: '#00C2AF', titleColor: '#174044'},
  {image: 'retro-pop.jpg', color: '#ef9c19', titleColor: '#1c1f3b'},
  {image: 'bridge.jpg', color: '#10d074', titleColor: '#dbfcef'},
  {image: 'cat.jpg', color: '#ef02a2', titleColor: '#85065c'},
  {image: 'city-nights.jpg', color: '#f7a73c', titleColor: '#ffefd8'},
  {image: 'foggy.jpg', color: '#a4d643', titleColor: '#e9e3d8'},
  {image: 'nebula.jpg', color: '#e8bc4b', titleColor: '#f5f1eb'},
  {image: 'neon-sign.jpg', color: '#ef349d', titleColor: '#fff'},
  {image: 'space-ship.jpg', color: '#7fb676', titleColor: '#f6ffe2'},
  {image: 'sleeping-cat.jpg', color: '#f3a11b', titleColor: '#fff'},
  {image: 'tiddly-winks.jpg', color: '#c1201c', titleColor: '#fff'},
  {image: 'typewriter.jpg', color: '#e42f11', titleColor: '#060606'}
]

# Console Easter Egg
consoleEasterEgg = (color) ->
  console.log "%c Welcome fellow DOM traveler!", "color: #f7a73c;"

# Initialization
init = () ->
  consoleEasterEgg(color)

# Run scripts on DOM ready
ready(init)



