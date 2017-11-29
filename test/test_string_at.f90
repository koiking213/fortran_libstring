use libstring
type(string)::s
s = 'aiueo'
if (s%at(1)/='a') print *,1
if (s%at(2)/='i') print *,2
if (s%at(3)/='u') print *,3
if (s%at(4)/='e') print *,4
if (s%at(5)/='o') print *,5
print *,'pass'
end
