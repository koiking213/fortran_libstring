  use libstring
  type(string) :: a,b
  a = 'hogehoge'
  if (a%find('og') /= 2) print *,1
  if (a%find('g') /= 3) print *,2
  if (a%find('aaa') /= -1) print *,3
  b = 'eho'
  if (a%find(b) /= 4) print *,4
  b = 'aaa'
  if (a%find(b) /= -1) print *,5
  if (a%find('hogehogeo') /= -1) print *,6
  if (a%find('hogehoge') /= 1) print *,7
  print *,'pass'
  end

