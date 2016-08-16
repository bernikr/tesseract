---
---

class @Point4d
  constructor: (x,y,z,a) ->
    if typeof x is "object"
      @c = x
    else
      @c = [x,y,z,a]

  rotate: (phi) ->
    # Definition of the rotation matrix
    rotmat = [[1, 0, 0, 0],
              [0, 1, 0, 0],
              [0, 0, Math.cos(phi), -Math.sin(phi)],
              [0, 0, Math.sin(phi),  Math.cos(phi)]]

    np = [0, 0, 0, 0] # Definition of the output array

    # Multiplication of the matrix with the vertex
    for i in [0..3]
      for j in [0..3]
        np[i] += rotmat[i][j] * @c[j]

    return new Point4d(np)

  to3d: () ->
    # Projektion: Verkürzung der Koordinaten
    new Point3d(x/Math.pow(2, @c[3]/2) for x in @c[0..2])

class @Point3d
  constructor: (x,y,z) ->
    if typeof x is "object"
      @c = x
    else
      @c = [x,y,z]

  rot: (phi) ->
    roty = data.rotation.y
    rotx = data.rotation.x
    #Definition der Rotationsmatrizen
    rotmaty = [[Math.cos(roty), 0, -Math.sin(roty)],
              [0, 1, 0],
              [Math.sin(roty), 0, Math.cos(roty)]]

    rotmatx = [[1, 0, 0],
               [0, Math.cos(rotx), -Math.sin(rotx)],
               [0, Math.sin(rotx), Math.cos(rotx)]]

    np = [0, 0, 0] # //Definition des Arrays des Zwischenspeichers
    nnp = [0, 0, 0] #//Definition des Arrays der Ausgabekoordinaten

    #//Multiplikation der Matrizen mit dem Punkt
    for i in [0..2]
      for j in [0..2]
        np[i] += rotmatx[i][j] * @c[j]
    for i in [0..2]
      for j in [0..2]
        nnp[i] += rotmaty[i][j] * np[j]

    return new Point3d(nnp); #// Rückgabe des gedrehten Punktes

  to2d: () ->
    x/Math.pow(2, @c[2]/2) for x in @c[0..1]
