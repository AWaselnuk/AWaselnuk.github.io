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

# Sets the theme image on the page
setThemeImage = (image, color) ->
  return if mobileBrowser
  styles =
    "
      .layout-mag-left {
        background-image: url(../img/#{image});
      }
    "
  appendStyles(styles)

# Add styles to the DOM
appendStyles = (styles) ->
  styleElement = document.createElement('style')
  styleElement.innerHTML = styles
  document.getElementsByTagName('head')[0].appendChild(styleElement)


# Console Easter Egg
consoleEasterEgg = (color) ->
  console.log "%c Welcome fellow DOM traveler!", "color: #{color};"

# Sets the theme color on the page
setThemeColor = (color) ->
  consoleEasterEgg(color)
  styles =
    "
      .random-color {
        color: #{color} !important;
      }
      .btn.random-color {
        background-color: #{color} !important;
      }
      a {
        color: #{color} !important;
      }
      a:hover {
        color: #{color} !important;
      }
      a.btn,
      a.btn-primary,
      a.btn:hover,
      a.btn-primary:hover,
      .read-all a,
      .read-all a:hover {
        color: #fff !important;
      }
    "
  appendStyles(styles)

setTitleColor = (color) ->
  return if mobileBrowser
  styles =
    "
      .masthead .title,
      .masthead .subtitle,
      .masthead .intro {
        color: #{color}
      }
    "
  appendStyles(styles)


# Returns the value from local storage or saves the passed in value then returns it.
# This is because I want the same theme to persist across a session
lockToSession = (key, value) ->
  inSession = sessionStorage.getItem key
  return inSession if inSession
  sessionStorage.setItem key, value
  value

# Choose a theme with a cover image and color
selectRandomTheme = (themes) ->
  randomTheme = themes[getRandomInt(0, themes.length)]
  setThemeColor(lockToSession('themeColor', randomTheme.color))
  setThemeImage(lockToSession('themeImage', randomTheme.image))
  setTitleColor(lockToSession('themeTitleColor', randomTheme.titleColor))

# Initialization
init = () ->
  selectRandomTheme(themes)

# Run scripts on DOM ready
ready(init)



