/*
on(d,c).
on(c,b).
on(b,a).
above(X,Y) :- on(X,Y).
above(X,Y) :- on(X,Z), above(Z,Y).

puzzle (V1, V2, V3, H1, H2, H3) :-
word(V1, _, A, _, B, _, C, _),
word(V2, _, D, _, E, _, F, _),
word(V3, _, G, _, H, _, I, _),
word(H1, _, A, _, D, _, G, _),
word(H2, _, B, _, E, _, H, _),
word(H3, _, C, _, F, _, I, _). 
*/
length([],0).
length([_|T], L) :- length(T, LT), L is LT + 1.

append([], L2, L2).
append([H | T], L2, [H | L3]) :- append(T, L2, L3).
%append([1,2,3], [a,b,c], R). R=[1,2,3,a,b,c]

%sum([1,7], A). A=8
sum([],0).
sum([H|T], S) :- sum(T, TA), S is H + TA.

average(L, A) :- sum(L, S), length(L, Le), A is S / Le.

member(A,[A|T]).
member(A,[H|T]) :- member(A,T).
%member(1, [1,2,3]) = true
