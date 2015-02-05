'use strict'

# Console Easter Egg
console.log '%c Welcome fellow DOM traveler! ', 'background: #002B36; color: #2AA198;'

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
  {image: 'homepage.jpg', color: '#00C2AF', titleColor: '#174044'},
  {image: 'homepage.jpg', color: '#00C2AF', titleColor: '#174044'}
]

# Sets the theme image on the page
setThemeImage = (image) ->
  # TODO : Write this
  true

# Add styles to the DOM
appendStyles = (styles) ->
  styleElement = document.createElement('style')
  styleElement.innerHTML = styles
  document.getElementsByTagName('head')[0].appendChild(styleElement)

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
  appendStyles(styles)

setTitleColor = (color) ->
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
  setThemeImage(lockToSession('themeImage', randomTheme.image))
  setThemeColor(lockToSession('themeColor', randomTheme.color))
  setTitleColor(lockToSession('themeTitleColor', randomTheme.titleColor))

# Initialization
init = () ->
  selectRandomTheme(themes)

# Run scripts on DOM ready
ready(init)



