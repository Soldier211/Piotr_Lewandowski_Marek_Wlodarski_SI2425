isnumber(zero).
isnumber(s(X)) :- isnumber(X). 

isequal(X,X) :- isnumber(X),!.
isequal(s(X),s(Y)) :- isequal(X,Y).

lessthanequal(zero,X) :- isnumber(X).
lessthanequal(s(X),s(Y)) :- lessthanequal(X,Y).

lessthan(X,Y) :- lessthanequal(X,Y), not(isequal(X,Y)).

add(zero,X,X) :- isnumber(X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

odd(s(zero)).
odd(s(s(X))) :- odd(X).

even(zero).
even(s(s(X))) :- even(X).

times(zero, X, zero) :- isnumber(X),!.
times(s(X), Y, Z) :- add(W,Y,Z),times(X,Y,W),!.

quotient(_, zero, _) :- fail.
quotient(zero, X, zero) :- isnumber(X),not(isequal(X,zero)),!.
quotient(X, s(zero), X) :- isnumber(X),!.
quotient(X, Y, zero) :- isnumber(X),isnumber(Y),lessthan(X, Y),!.
quotient(X, Y, s(Q)) :- isnumber(X),isnumber(Y),isnumber(Q),not(isequal(Y, zero)),add(Y, W, X),quotient(W, Y, Q),!.

remainder(X,zero,X) :- isnumber(X),!.
remainder(X,Y,X) :- isnumber(X),isnumber(Y),lessthan(X,Y),!.
remainder(X,Y,R) :- add(W,Y,X),remainder(W,Y,R),!.

fact(N,X) :- lessthanequal(N, s(zero)),isequal(X,s(zero)),!.
fact(s(N),X) :- fact(N,Y),times(Y,s(N),X),!.

fibonacci(zero,zero).
fibonacci(s(zero),s(zero)).
fibonacci(s(s(N)),X) :- fibonacci(s(N),W),fibonacci(N,Z),add(W,Z,X).

shownum(zero,0).
shownum(s(X),N) :- shownum(X, M), N is M + 1.
