(function() {
  'use strict';
  var appendStyles, consoleEasterEgg, getRandomInt, init, lockToSession, mobileBrowser, ready, selectRandomTheme, setThemeColor, setThemeImage, setTitleColor, themes;

  ready = function(fn) {
    if (document.readyState !== 'loading') {
      return fn();
    } else {
      return document.addEventListener('DOMContentLoaded', fn);
    }
  };

  mobileBrowser = window.innerWidth <= 800;

  getRandomInt = function(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
  };

  themes = [
    {
      image: 'tree.jpg',
      color: '#00C2AF',
      titleColor: '#174044'
    }, {
      image: 'retro-pop.jpg',
      color: '#ef9c19',
      titleColor: '#1c1f3b'
    }, {
      image: 'bridge.jpg',
      color: '#10d074',
      titleColor: '#dbfcef'
    }, {
      image: 'cat.jpg',
      color: '#ef02a2',
      titleColor: '#85065c'
    }, {
      image: 'city-nights.jpg',
      color: '#f7a73c',
      titleColor: '#ffefd8'
    }, {
      image: 'foggy.jpg',
      color: '#a4d643',
      titleColor: '#e9e3d8'
    }, {
      image: 'nebula.jpg',
      color: '#e8bc4b',
      titleColor: '#f5f1eb'
    }, {
      image: 'neon-sign.jpg',
      color: '#ef349d',
      titleColor: '#fff'
    }, {
      image: 'space-ship.jpg',
      color: '#7fb676',
      titleColor: '#f6ffe2'
    }, {
      image: 'sleeping-cat.jpg',
      color: '#f3a11b',
      titleColor: '#fff'
    }, {
      image: 'tiddly-winks.jpg',
      color: '#c1201c',
      titleColor: '#fff'
    }, {
      image: 'typewriter.jpg',
      color: '#e42f11',
      titleColor: '#060606'
    }
  ];

  setThemeImage = function(image, color) {
    var styles;
    if (mobileBrowser) {
      return;
    }
    styles = ".layout-mag-left { background-image: url(../img/" + image + "); }";
    return appendStyles(styles);
  };

  appendStyles = function(styles) {
    var styleElement;
    styleElement = document.createElement('style');
    styleElement.innerHTML = styles;
    return document.getElementsByTagName('head')[0].appendChild(styleElement);
  };

  consoleEasterEgg = function(color) {
    return console.log("%c Welcome fellow DOM traveler!", "color: " + color + ";");
  };

  setThemeColor = function(color) {
    var styles;
    consoleEasterEgg(color);
    styles = ".random-color { color: " + color + " !important; } .btn.random-color { background-color: " + color + " !important; } a { color: " + color + " !important; } a:hover { color: " + color + " !important; } a.btn, a.btn-primary, a.btn:hover, a.btn-primary:hover, .read-all a, .read-all a:hover { color: #fff !important; }";
    return appendStyles(styles);
  };

  setTitleColor = function(color) {
    var styles;
    if (mobileBrowser) {
      return;
    }
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
    setThemeColor(lockToSession('themeColor', randomTheme.color));
    setThemeImage(lockToSession('themeImage', randomTheme.image));
    return setTitleColor(lockToSession('themeTitleColor', randomTheme.titleColor));
  };

  init = function() {
    return selectRandomTheme(themes);
  };

  ready(init);

}).call(this);
