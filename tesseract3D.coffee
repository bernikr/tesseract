---
---
data.rotation = {
  alpha: 0,         # Current angle of the 4D rotation
  beta: 0,
  gamma: 0,
  speed: Math.PI/100 # Rotation speed
  isRunning: true  # Status of the rotation
}
data.scale = 100                   # Scaling factor

# magic numbers
LEFT = 0
RIGHT = 1

$ => @P = new Processing('canvas', ready)

ready = (P) ->
  P.setup = ->
    P.size($(window).width(),$(window).height())
    setInterval P.redraw, 50 # I don't know, why this is needed...

  P.draw = ->
    P.background(255)
    P.stroke(0)
    P.fill(255, 0, 0, 50)

    P.translate(P.width/4, P.height/2)

    drawFaces(LEFT)
    drawEdges(LEFT)

    P.translate(P.width/2, 0)

    drawFaces(RIGHT)
    drawEdges(RIGHT)

    # 4D rotation
    if (data.rotation.isRunning)
      data.rotation.alpha += data.rotation.speed
      data.rotation.alpha = data.rotation.alpha%360

drawFaces = (pos) ->
  for face in data.cube.faces
    P.beginShape()
    for v in face
      [x,y] = projectVertex(v, pos)
      P.vertex(x/2, y)
    P.endShape(P.CLOSE)

drawEdges = (pos) ->
  for edge in data.cube.edges
    [x1,y1] = projectVertex(edge[0], pos)
    [x2,y2] = projectVertex(edge[1], pos)
    P.line(x1/2, y1, x2/2, y2)

projectVertex = (v, pos) ->
  rot = data.rotation
  v = v.rotate(rot.alpha)           # rotate in 4D
  v = v.to3d()                      # project 4D to 3D

  delta = Math.PI/100
  delta = -delta if pos == RIGHT

  v = v.rotate(rot.beta - delta, rot.gamma) # rotate in 3D
  v = v.to2d()                      # project 3D to 2D
  v = (x*data.scale for x in v)     # scale the 2D vertex
  return v

# 3D mouse rotation
$(document).mousemove (e)->
  mouseToAngle = (x, r) -> P.map(x, -r/2, r/2, Math.PI, -Math.PI)
  data.rotation.beta = mouseToAngle(e.pageX, $(window).width())
  data.rotation.gamma = mouseToAngle(e.pageY, $(window).height())

$(window).resize ->
  P.size($(window).width(),$(window).height())
