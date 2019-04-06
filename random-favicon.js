const fs = require('fs'),
      PNG = require('pngjs').PNG

var hsltorgb, paint;

hsltorgb = function(h, s, l) {
  var hue, m1, m2;
  h = (h % 360) / 360;
  m2 = l * (s + 1);
  m1 = (l * 2) - m2;
  hue = function(num) {
    if (num < 0) {
      num += 1;
    } else if (num > 1) {
      num -= 1;
    }
    if ((num * 6) < 1) {
      return m1 + (m2 - m1) * num * 6;
    } else if ((num * 2) < 1) {
      return m2;
    } else if ((num * 3) < 2) {
      return m1 + (m2 - m1) * (2 / 3 - num) * 6;
    } else {
      return m1;
    }
  };
  return [hue(h + 1 / 3) * 255, hue(h) * 255, hue(h - 1 / 3) * 255];
};

paint = function() {
  var angle, colprep, cos, dark, i, height, light, p, png, scale, sin, width, x, y;
  light = hsltorgb(Math.random() * 360, .78, .4)
  dark = hsltorgb(Math.random() * 360, .78, .55)
  angle = 2 * (Math.random() - 0.5)
  sin = Math.sin(angle)
  cos = Math.cos(angle)
  scale = Math.abs(sin) + Math.abs(cos)
  colprep = function(col, p) {
    return Math.floor(light[col] * p + dark[col] * (1 - p)) % 255
  }
  width = 32, height = 32
  png = new PNG({width, height})
  for (x = i = 0; i <= width; x = ++i) {
    var j
    for (y = j = 0; j <= height; y = ++j) {
      p = sin >= 0 ? sin * x + cos * y : -sin * (width - x) + cos * y
      p = p / height / scale

      var idx = (width * y + x) << 2;

      png.data[idx] = colprep(0, p)
      png.data[idx + 1] = colprep(1, p)
      png.data[idx + 2] = colprep(2, p)
      png.data[idx + 3] = 0xff
    }
  }
  return png
}

paint().pack()
  .pipe(fs.createWriteStream(__dirname + '/.data/status/favicon.png'))
  .on('finish', function() {
    console.log('favicon.png Written!');
  });

module.exports = paint
