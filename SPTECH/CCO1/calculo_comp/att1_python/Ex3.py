from math import floor
from math import ceil


w = 3345.61

piso = floor(w)
teto = ceil(w)
arredondamento = (piso + teto) / 2

print('teto = ', teto)
print('piso = ', piso)
print('arredondamento = ', arredondamento)


