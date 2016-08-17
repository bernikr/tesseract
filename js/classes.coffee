###
This class provides a way to store a 4D vertex and to perform various
operations on it.
###
class @Point4d
  ###
  Construct a new 4D vertex.
  @constructor
  @param {Object[]} c The 4 coordinates of the vertex.
  @param {float} c[] A coordinate in a single dimension.
  @returns {Point4d}
  ###
  constructor: (@c) ->

  ###
  Rotate a point around the origin in the fourth dimension.
  @param {float} phi The angle of the rotation in radians.
  @returns {Point4d}
  ###
  rotate: (phi) ->
    # Definition of the rotation matrix
    rotmat = [[1, 0, 0, 0],
              [0, 1, 0, 0],
              [0, 0, Math.cos(phi), -Math.sin(phi)],
              [0, 0, Math.sin(phi),  Math.cos(phi)]]

    return new Point4d(transformVector(@c, rotmat))

  ###
  Return the vertex projected into 3D space
  @returns {Point3d}
  ###
  to3d: -> new Point3d(projectCoordinate(x, @c[3]) for x in @c[0..2])

###
This class provides a way to store a 3D vertex and to perform various
operations on it.
###
class @Point3d
  ###
  Construct a new 3D vertex.
  @constructor
  @param {float[]} c The 3 coordinates of the vertex.
  @returns {Point3d}
  ###
  constructor: (@c) ->

  ###
  Rotate a point around the origin in the thrid dimension.
  @param {float} a The angle of the rotation around the x-axis in radians.
  @param {float} b The angle of the rotation around the y-axis in radians.
  @returns {Point3d}
  ###
  rotate: (a, b) ->
    # Definition of the rotation matrices
    rotationMatrix1 = [[1, 0, 0],
                      [0, Math.cos(a), -Math.sin(a)],
                      [0, Math.sin(a), Math.cos(a)]]
    rotationMatrix2 = [[Math.cos(b), 0, -Math.sin(b)],
                      [0, 1, 0],
                      [Math.sin(b), 0, Math.cos(b)]]

    v = transformVector(@c, rotationMatrix1)
    v = transformVector(v, rotationMatrix2)
    return new Point3d(v)

  ###
  Return the vertex projected into 2D space.
  @returns {float[]} The 2D coordinates of the projected vertex.
  ###
  to2d: -> projectCoordinate(x, @c[2]) for x in @c[0..1]

###
Perfroms a perspective projection by shortening a coordinate according to the
coordinate in the omitted direction.
@param {float} x The coordinate has to be projected.
@param {float} a The coordinate in the direction of the projection.
@returns {float} The projected coordinate.
###
projectCoordinate = (x, a) -> x/Math.pow(2, a/2)

###
Perfrom a vector transformation by multiplying it with a matrix.
@param {float[]} vector The input vector.
@param {float[][]} matrix The matrix for the transformation.
@retruns {float[]} The transformed vector.
###
transformVector = (vector, matrix) ->
  dim = vector.length
  output = (0 for i in [1..dim])
  for i in [0..dim-1]
    for j in [0..dim-1]
      output[i] += matrix[i][j] * vector[j]
  return output
