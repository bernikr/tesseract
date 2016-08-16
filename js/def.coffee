cube = data.cube
###
Create an array of the 16 vertexes of the tesseract. A vertex of the tesseract
has 4 coordinates, each with 2 possibilites, 1 or -1. Therefore we need every
combination from -1-1-1-1 to 1111. If we look at this as binary values, we need
every nuber from 0 to 1111 (15). To get a digit of the binary represantation we
can use a bitwise and (&) with either 1,2,4 or 8. This results in either 0 or
1,2,4 or 8 depending on the location of the bit, which can be maped to eiter -1
or 1.
###
v = cube.vertexes = for x in [0..16]
  c = (dimension) ->
    binaryDim = [1,2,4,8]              # helper-array
    isOne = x & binaryDim[dimension]   # bitwise and
    return if isOne > 0 then 1 else -1 # casting on -1 and 1
  new Point4d(c(3), c(2), c(1),  c(0))

###
Create the array of the 32 edges by looking at the 120 possible pairs of
vertexes and adding those who have exactly 3 coordinates in common.
###
cube.edges = []
for i in [0..14]
  for j in [i+1..15]
    c = 0
    for k in [0..3]
      c++ if v[i].c[k] == v[j].c[k]
    cube.edges.push([v[i], v[j]]) if c == 3

###
Select the 24 faces out of the 1820 possible choices of 4 vertexes by choosing
quadruplets that have 2 coordinates in common.
WARNING: The order of vertexes in a face is important and has to be acdb for
some reason.
###
cube.faces = []
for a in [0..12]
  for b in [a+1..13]
    for c in [b+1..14]
      for d in [c+1..15]
        count = 0
        for i in [0..3]
          count++ if v[a].c[i] == v[b].c[i] == v[c].c[i] == v[d].c[i]
        cube.faces.push([v[a], v[c], v[d], v[b]]) if count == 2
