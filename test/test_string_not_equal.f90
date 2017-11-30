use libstring
type(string) :: s1,s2
character(10) :: c='aiu'
s1 = 'aiu'
s2 = 'aiu'
if (s1 /= s2) print *,1
if (s1 /= c) print *,2
if (c /= s2) print *,3
s1 = 'hoge'
if (.not.(s1 /= s2)) print *,4
if (.not.(s1 /= c)) print *,5
if (.not.(c /= s1)) print *,6
print *,'pass'
end
