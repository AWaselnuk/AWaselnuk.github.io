(function() {
  'use strict';
  var getRandomInt, init, ready, selectRandomColor;

  ready = function(fn) {
    if (document.readyState !== 'loading') {
      return fn();
    } else {
      return document.addEventListener('DOMContentLoaded', fn);
    }
  };

  getRandomInt = function(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
  };

  selectRandomColor = function() {
    var colors, randomColor, styleElement, styles;
    colors = ['#00C2AF', '#F13CAB'];
    randomColor = colors[getRandomInt(0, colors.length)];
    styles = ".random-color { color: " + randomColor + " !important; } .btn.random-color { background-color: " + randomColor + " !important; } a { color: " + randomColor + " !important; } a:hover { color: " + randomColor + " !important; } a.btn, a.btn-primary, a.btn:hover, a.btn-primary:hover, .read-all a, .read-all a:hover { color: #fff !important; }";
    styleElement = document.createElement('style');
    styleElement.innerHTML = styles;
    return document.getElementsByTagName('head')[0].appendChild(styleElement);
  };

  init = function() {
    return selectRandomColor();
  };

  ready(init);

}).call(this);
