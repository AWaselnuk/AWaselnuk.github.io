'use strict'

# DOM Ready
ready = (fn) ->
  if document.readyState != 'loading'
    fn()
  else
    document.addEventListener 'DOMContentLoaded', fn

# Initialization
init = () ->
  console.log "%c Welcome fellow DOM traveler!", "color: #f7a73c;"

# Run scripts on DOM ready
ready(init)



