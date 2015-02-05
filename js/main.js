(function() {
  'use strict';
  var appendStyles, getRandomInt, init, lockToSession, ready, selectRandomTheme, setThemeColor, setThemeImage, setTitleColor, themes;

  console.log('%c Welcome fellow DOM traveler! ', 'background: #002B36; color: #2AA198;');

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
      color: '#00C2AF',
      titleColor: '#174044'
    }, {
      image: 'homepage.jpg',
      color: '#00C2AF',
      titleColor: '#174044'
    }
  ];

  setThemeImage = function(image) {
    return true;
  };

  appendStyles = function(styles) {
    var styleElement;
    styleElement = document.createElement('style');
    styleElement.innerHTML = styles;
    return document.getElementsByTagName('head')[0].appendChild(styleElement);
  };

  setThemeColor = function(color) {
    var styles;
    styles = ".random-color { color: " + color + " !important; } .btn.random-color { background-color: " + color + " !important; } a { color: " + color + " !important; } a:hover { color: " + color + " !important; } a.btn, a.btn-primary, a.btn:hover, a.btn-primary:hover, .read-all a, .read-all a:hover { color: #fff !important; }";
    return appendStyles(styles);
  };

  setTitleColor = function(color) {
    var styles;
    styles = ".masthead .title, .masthead .subtitle, .masthead .intro { color: " + color + " }";
    return appendStyles(styles);
  };

  lockToSession = function(key, value) {
    var inSession;
    inSession = sessionStorage.getItem(key);
    if (inSession) {
      return inSession;
    }
    sessionStorage.setItem(key, value);
    return value;
  };

  selectRandomTheme = function(themes) {
    var randomTheme;
    randomTheme = themes[getRandomInt(0, themes.length)];
    setThemeImage(lockToSession('themeImage', randomTheme.image));
    setThemeColor(lockToSession('themeColor', randomTheme.color));
    return setTitleColor(lockToSession('themeTitleColor', randomTheme.titleColor));
  };

  init = function() {
    return selectRandomTheme(themes);
  };

  ready(init);

}).call(this);
