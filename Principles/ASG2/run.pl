ordered([X]).
ordered([H | [H1 | T]]) :- H1 >= H, ordered([H1 | T]).

reverse([], []).
reverse([H | T], [G | H]) :- G is reverse(T).

sum([], 0).
sum([H | T], S) :- sum(T, S1), S is S1 + 1.

append([], C, [C]).
append([H | T], C, [R | G]) :- append(T, C, R).