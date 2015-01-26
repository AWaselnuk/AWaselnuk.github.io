(function () {
  'use strict';

  // DOM Ready
  function ready(fn) {
    if (document.readyState != 'loading') {
      fn();
    } else {
      document.addEventListener('DOMContentLoaded', fn);
    }
  }

  // Returns a random integer between min (included) and max (excluded)
  function getRandomInt(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
  }

  // Random Color generator
  function selectRandomColor() {
    var colors = ['#00C2AF', '#F13CAB'];
    var randomColor = colors[getRandomInt(0,colors.length)];

    var styles = '<style>' +
      '.random-color {' +
      'background-color: ' + randomColor +
      'color: ' + randomColor +
      '}' +
      '</style>';
  }

  // Initialization
  function init() {

    selectRandomColor();

  }

  // Run scripts on DOM ready
  ready(init);

})();

