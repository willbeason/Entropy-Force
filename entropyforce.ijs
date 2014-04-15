scale=: % */&$ NB. Counts number of elements and divides by it
ent=: *_1* 2&^. NB. Calculates entropy of a probability
mean=: +/ %#

n=:10
ph=:60%100
h=:n*ph



pp=: 3 : 0
if. (%&2 n+2) > (* *) ((n%2)-y) do. (1 - y % n) * ph
else. 0 end.
)

pm=: 3 : 0
if. (%&2 n+2) > (* *) ((n%2)-y) do. (y % n) * (1 - ph)
else. 0 end.
)

pn=: 3 : 0
1 - +/ (pm,pp) y
)

enty=: 3 : 0
+/"1 ent (pn,pp,pm)"0 y
)

grad=: 3 : 0
%&2 -/ (enty y+(1,-1))
)

start=: ? n$2

step=: 3 : 0
(ph>?0) (?#y)}y
)

equil=: I. (= >./) enty i.(n+1)

ap=: 3 : 0
((1+0{y),(1{y)*pp(0{y))
)

am=: 3 : 0
((_1+0{y),(1{y)*pm(0{y))
)

an=: 3 : 0
((0{y),(1{y)*pn(0{y))
)

T=: 3 : 0
3 2$ (am,an,ap) y
)

evolve=: 4 : 0
((T"1)^:(x-1)) (T y)
)

pent=: 4 : 0
(+/)^:x ent 1{"1 (x evolve y)
)

9 pent 5 1