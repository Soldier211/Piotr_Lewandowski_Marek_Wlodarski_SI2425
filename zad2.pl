parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(joe, jim).

male(tom).
male(bob).
male(joe).
male(jim).

female(pam).
female(liz).
female(ann).
female(pat).

son(X, Y) :- parent(Y, X), male(X).
granddaughter(X, Y) :- parent(Y, Z), parent(Z, X), female(X).
aunt(X, Y) :- female(X), parent(Z, X), parent(Z, P), parent(P, Y), \+ parent(X, Y).
partner(X, Y) :- parent(X, Z), parent(Y, Z), X\=Y.