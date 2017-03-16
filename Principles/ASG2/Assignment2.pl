%<emptytree> ::= [].
%<bintree> ::= <emptytree>.
%<bintree> ::= [<int> <bintree> <bintree>].

%1a)
empty([]).
btree([]).
btree([H | [T1 | [T2 | T3]]]) :- empty(T3), integer(H), btree(T1), btree(T2).

%1b)
full([]).
full([H | [T1 | [T2 | T3]]]) :- empty(T3), integer(H), empty(T1), empty(T2).
full([H | [T1 | [T2 | T3]]]) :- empty(T3), integer(H), not(empty(T1)), not(empty(T2)), full(T1), full(T2).
%%%% need to know what not is in prolog

%1c)
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.
height([], 0).
height([H | [T1 | [T2 | _]]], A) :- height(T1, A1), height(T2, A2), max(A1, A2, Q), A is Q + 1.

%1d)
nodes([], 0).
nodes([H | [T1 | [T2 | _]]], A) :- nodes(T1, A1), nodes(T2, A2), A is A1 + A2 + 1.

%1e)
%append([], Ys, Ys).
%append([X|Xs], Ys, [X|Zs]) :-append (Xs, Ys, Zs).
preorder([], []).
preorder([H | [T1 | [T2 | T3]]], A) :- preorder(T1, P1), preorder(T2, P2), append([H], P1, B), append(B, P2, A).
%preorder([1, [2,[4, [], []],[]], [3,[5, [], []],[]]], I).

%1f)
inorder([], []).
inorder([H | [T1 | [T2 | T3]]], A) :- inorder(T1, P1), inorder(T2, P2), append(P1, [H], B), append(B, P2, A).

%2)

def(45, negative).
def(48, zero).
def(49, one).
def(50, two).
def(51, three).
def(52, four).
def(53, five).
def(54, six).
def(55, seven).
def(56, eight).
def(57, nine).

ntoe(N, E) :- name(N, List), ntoeH(List, E).
ntoeH([], []).
ntoeH([H | T], [A1 | A2]) :- ntoeH(T, A2), def(H, A1).

eton(E, N) :- etonH(N, A), name(E, A).
etonH([], []).
etonH([H | T], [A1 | A2]) :- etonH(T, A2), def(A1, H).

%3)
isvowel(a).
isvowel(e).
isvowel(i).
isvowel(o).
isvowel(u).
countconsonants(N, E) :- atom_chars(N, List), countC(List, E).
countC([], 0).
countC([H | T], E) :- not(isvowel(H)), countC(T, E1), E is E1 + 1.
countC([H | T], E) :- isvowel(H), countC(T, E).
%E = [97, 101, 105, 111, 117].

%4)
eqv(0, zero).
eqv(1, one).
eqv(2, two).
eqv(3, three).
eqv(4, four).
eqv(5, five).
eqv(6, six).
eqv(7, seven).
eqv(8, eight).
eqv(9, nine).

count(N, M, K) :- N =< M, N >= 0, eqv(N, A), K = A.
count(N, M, K) :- N =< M, N < 0, ntoe(N, A), K = A.
count(N, M, K) :- N < M, N1 is N+1, count(N1, M, K).