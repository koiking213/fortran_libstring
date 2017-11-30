use libstring
type(string)::s
s = 'aiu'
if (s*3 /= 'aiuaiuaiu') print *,s*3
if (3*s /= 'aiuaiuaiu') print *,3*s
print *,'pass'
end
