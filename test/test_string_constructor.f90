  use libstring
!  type(string) :: s1 = string('hoge') not supported in gcc-7.2?
  type(string) :: s2
  s2 = string('fuga')

!  if (s1 /= 'hoge') print *,1
  if (s2 /= 'fuga') print *,2
  if (string('piyo') /= 'piyo') print *,3
  print *,'pass'
  end
