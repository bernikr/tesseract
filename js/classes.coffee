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

    return new Point4d(transformVector(@c, rotmat))

  to3d: -> new Point3d(projectCoordinate(x, @c[3]) for x in @c[0..2])

class @Point3d
  constructor: (x,y,z) ->
    if typeof x is "object"
      @c = x
    else
      @c = [x,y,z]

  rotate: (a, b) ->

    # Definition of the rotation matrices
    rotationMatrix1 = [[Math.cos(a), 0, -Math.sin(a)],
                      [0, 1, 0],
                      [Math.sin(a), 0, Math.cos(a)]]
    rotationMatrix2 = [[1, 0, 0],
                      [0, Math.cos(b), -Math.sin(b)],
                      [0, Math.sin(b), Math.cos(b)]]

    v = transformVector(@c, rotationMatrix1)
    v = transformVector(v, rotationMatrix2)
    return new Point3d(v)

  to2d: -> projectCoordinate(x, @c[2]) for x in @c[0..1]

projectCoordinate = (x, a) -> x/Math.pow(2, a/2)

transformVector = (vector, matrix) ->
  dim = vector.length
  output = (0 for i in [1..dim])
  for i in [0..dim-1]
    for j in [0..dim-1]
      output[i] += matrix[i][j] * vector[j]
  return output
