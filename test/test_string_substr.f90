use libstring
type(string) :: s
s = 'aiueo'
if (s%substr(2,4) /= 'iue') print *,1,s%substr(2,4)
if (s%substr(2) /= 'iueo') print *,2,s%substr(2)
if (s%substr(end=3) /= 'aiu') print *,3,s%substr(end=3)
print *,'pass'
end
