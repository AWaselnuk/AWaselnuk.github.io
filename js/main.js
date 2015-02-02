(function() {
  'use strict';
  var getRandomInt, init, ready, selectRandomTheme, setThemeColor, setThemeImage, themes;

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

  themes = [
    {
      image: 'homepage.jpg',
      color: '#00C2AF'
    }, {
      image: 'homepage.jpg',
      color: '#F13CAB'
    }
  ];

  setThemeImage = function(image) {
    return true;
  };

  setThemeColor = function(color) {
    var styleElement, styles;
    styles = ".random-color { color: " + color + " !important; } .btn.random-color { background-color: " + color + " !important; } a { color: " + color + " !important; } a:hover { color: " + color + " !important; } a.btn, a.btn-primary, a.btn:hover, a.btn-primary:hover, .read-all a, .read-all a:hover { color: #fff !important; }";
    styleElement = document.createElement('style');
    styleElement.innerHTML = styles;
    return document.getElementsByTagName('head')[0].appendChild(styleElement);
  };

  selectRandomTheme = function(themes) {
    var randomTheme;
    randomTheme = themes[getRandomInt(0, themes.length)];
    setThemeImage(randomTheme.image);
    return setThemeColor(randomTheme.color);
  };

  init = function() {
    return selectRandomTheme(themes);
  };

  ready(init);

}).call(this);
