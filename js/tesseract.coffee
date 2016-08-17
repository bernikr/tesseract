---
---
@data =
  rotation:
    alpha: 0           # Current angle of the 4D rotation
    beta:  0           # Current angle of the 3D rotation around the y-axis
    gamma: 0           # Current angle of the 3D rotation around the x-axis
    delta: Math.PI/100 # Angle difference between the two 3D cubes
    speed: Math.PI/100 # Rotation speed
    isRunning: true    # Status of the rotation
  scale: 70            # Scaling factor
  is3D: false
  cube: {}

# magic numbers
LEFT = -1
NO3D = 0
RIGHT = 1
SETUP = 0
FRONT = 1
BACK = -1

{% include_relative classes.coffee %}
{% include_relative def.coffee %}
{% include_relative lol.coffee %}

$ => @P = new Processing('canvas', ready)

ready = (P) ->
  P.setup = ->
    if data.is3D
      P.size($(window).width(),$(window).height())
      lol(SETUP, P)
    else
      P.size(500, 500)
    setInterval P.redraw, 50 # I don't know, why this is needed...

  P.draw = ->
    P.background(255)
    P.stroke(0)
    P.fill(255, 0, 0, 50)

    if data.is3D
      lol(BACK, P)
      P.fill(255, 0, 0, 50)
      P.pushMatrix()
      P.translate(P.width/4 , P.height/2)
      drawFaces(LEFT)
      drawEdges(LEFT)
      P.translate(P.width/2, 0)
      drawFaces(RIGHT)
      drawEdges(RIGHT)
      P.popMatrix()
      lol(FRONT, P)
    else
      P.translate(P.width/2 , P.height/2)
      drawFaces(NO3D)
      drawEdges(NO3D)

    # 4D rotation
    if (data.rotation.isRunning)
      data.rotation.alpha += data.rotation.speed
      data.rotation.alpha = data.rotation.alpha%360

drawFaces = (pos) ->
  for face in data.cube.faces
    P.beginShape()
    for v in face
      [x,y] = projectVertex(v, pos)
      P.vertex(x, y)
    P.endShape(P.CLOSE)

drawEdges = (pos) ->
  for edge in data.cube.edges
    [x1,y1] = projectVertex(edge[0], pos)
    [x2,y2] = projectVertex(edge[1], pos)
    P.line(x1, y1, x2, y2)

projectVertex = (v, pos) ->
  rot = data.rotation
  v = v.rotate(rot.alpha)                           # rotate in 4D
  v = v.to3d()                                      # project 4D to 3D
  v = v.rotate(rot.gamma, rot.beta + rot.delta*pos) # rotate in 3D
  v = v.to2d()                                      # project 3D to 2D
  v = (x*data.scale for x in v)                     # scale the 2D vertex
  v[0] = v[0]/2 if pos != 0                # squash the vertex in 3D mode
  return v

# 3D mouse rotation
$(document).mousemove (e)->
  mouseToAngle = (x, r) -> P.map(x, -r/2, r/2, Math.PI, -Math.PI)
  data.rotation.beta = mouseToAngle(e.pageX, $(window).width())
  data.rotation.gamma = mouseToAngle(e.pageY, $(window).height())

###
In 3D mode resize the canvas on a window resize.
(Important for switching to fullscreen.)
###
$(window).resize ->
  P.size($(window).width(),$(window).height()) if data.is3D
