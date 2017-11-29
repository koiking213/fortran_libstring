use libstring
type(string) :: s
s = 'aiueo'
if (s%substr(2,4) /= 'iue') print *,s%substr(2,4)
if (s%substr(2) /= 'iueo') print *,s%substr(2)
if (s%substr(end=3) /= 'aiu') print *,s%substr(end=3)
print *,'pass'
end
