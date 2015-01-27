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

# Random Color generator
selectRandomColor = () ->
  colors = ['#00C2AF', '#F13CAB']
  randomColor = colors[getRandomInt(0, colors.length)]

  styles =
    "
      .random-color {
        color: #{randomColor} !important;
      }
      .btn.random-color {
        background-color: #{randomColor} !important;
      }
      a {
        color: #{randomColor} !important;
      }
      a:hover {
        color: #{randomColor} !important;
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

# Initialization
init = () ->
  selectRandomColor()

# Run scripts on DOM ready
ready(init)



