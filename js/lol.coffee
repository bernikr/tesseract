doge = {i: null, x: 0, s:1, first: true, comic: null}
lol = (pos, P) ->
  rand = -> Math.random()*255
  [h, w] = [P.height, P.width]
  data.lol = true if window.location.hash == '#lol'
  if data.lol
    if doge.first
      doge.comic = P.loadFont('cursive', 60)
      P.textAlign(P.CENTER, P.CENTER)
      doge.i = P.loadImage('assets/doge.gif')
      doge.first = false
    if pos == BACK
      P.textFont(doge.comic, h/14)
      P.fill(rand(), rand(), rand())
      P.text("wow", w/4+h/7, h/5)
      P.text("wow", w/4*3+h/7*1.1, h/5)
      P.fill(0, 0, 255)
      P.text("so cool", w/2-h/7*1.5, h/2-h/14)
      P.text("so cool", w-h/7*1.5+h/28, h/2-h/14 )
    else if pos == FRONT
      P.fill(255, 0, 0)
      P.text("very 3d", h/7, h/2+h/10 )
      P.text("very 3d", h/7+w/2-h/70*0.2, h/2+h/10)
      P.fill(0, 255, 0)
      P.text("much realism", w/2-h/7*2, h-h/10)
      P.text("much realism", w-h/7*2-h/100, h-h/10)
      P.image(doge.i,     h/14,        h/14, h/7-doge.x/4, h/7*2-doge.x/2)
      P.image(doge.i, w/2+h/14+doge.x, h/14, h/7-doge.x/4, h/7*2-doge.x/2)
      doge.x += doge.s
      doge.s *= -1 if (doge.x > h/70*1.5 || doge.x < -h/70*1.5)
