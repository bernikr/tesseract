---
---
data.rotation = {
  alpha: 0,         # Current angle of the 4D rotation
  beta: 0,
  gamma: 0,
  speed: Math.PI/100 # Rotation speed
  isRunning: true  # Status of the rotation
}
data.scale = 70                   # Scaling factor

$ => @P = new Processing('canvas', ready)

ready = (P) ->
  P.setup = ->
    P.size(500, 500)
    P.stroke(0)
    P.fill(255, 0, 0, 50)

    setInterval P.redraw, 50 # I don't know, why this is needed...

  P.draw = ->
    P.background(255)
    P.translate(P.width/2, P.height/2)

    drawFaces()
    drawEdges()

    # 4D rotation
    if (data.rotation.isRunning)
      data.rotation.alpha += data.rotation.speed
      data.rotation.alpha = data.rotation.alpha%360

drawFaces = ->
  for face in data.cube.faces
    P.beginShape()
    for v in face
      [x,y] = projectVertex(v)
      P.vertex(x, y)
    P.endShape(P.CLOSE)

drawEdges = ->
  for edge in data.cube.edges
    [x1,y1] = projectVertex(edge[0])
    [x2,y2] = projectVertex(edge[1])
    P.line(x1, y1, x2, y2)

projectVertex = (v) ->
  rot = data.rotation
  v = v.rotate(rot.alpha)           # rotate in 4D
  v = v.to3d()                      # project 4D to 3D
  v = v.rotate(rot.beta, rot.gamma) # rotate in 3D
  v = v.to2d()                      # project 3D to 2D
  v = (x*data.scale for x in v)     # scale the 2D vertex
  return v

# 3D mouse rotation
$(document).mousemove (e)->
  mouseToAngle = (x, r) -> P.map(x, -r/2, r/2, Math.PI, -Math.PI)
  data.rotation.beta = mouseToAngle(e.pageX, $(window).width())
  data.rotation.gamma = mouseToAngle(e.pageY, $(window).height())
