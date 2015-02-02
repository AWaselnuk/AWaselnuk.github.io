'use strict'

# DOM Ready
ready = (fn) ->
  if document.readyState != 'loading'
    fn()
  else
    document.addEventListener 'DOMContentLoaded', fn

# Returns a random integer between min (included) and max (excluded)
getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min)) + min

# A collection of themes with a cover image and color
themes = [
  {image: 'homepage.jpg', color: '#00C2AF'},
  {image: 'homepage.jpg', color: '#F13CAB'}
]

# Sets the theme image on the page
setThemeImage = (image) ->
  # TODO : Write this
  true

# Sets the theme color on the page
setThemeColor = (color) ->
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
  styleElement = document.createElement('style')
  styleElement.innerHTML = styles
  document.getElementsByTagName('head')[0].appendChild(styleElement)

# Returns the value from local storage or saves the passed in value.
# This is because I want the same theme to persist across a session
lockToSession = (key, value) ->
  # TODO: Write this
  value

# Choose a theme with a cover image and color
selectRandomTheme = (themes) ->
  randomTheme = themes[getRandomInt(0, themes.length)]
  setThemeImage(lockToSession('themeImage', randomTheme.image))
  setThemeColor(lockToSession('themeColor', randomTheme.color))

# Initialization
init = () ->
  selectRandomTheme(themes)

# Run scripts on DOM ready
ready(init)



