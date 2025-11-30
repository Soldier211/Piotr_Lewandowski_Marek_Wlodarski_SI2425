member1(X,[X|_]).
member1(X,[_|T]) :- member1(X,T).

append1([],L,L).
append1([H|T1],L,[H|T2]) :- concat1(T1,L,T2).

concat1([],L,L).
concat1([H|T1],L,[H|T2]) :- concat1(T1,L,T2).

% Tu nie znalazlem w wykladac czy ma delete wszystko czy 1 wystapienie

delete1(_,[],[]).
delete1(H,[H|T],L) :- !, delete1(H,T,L).
delete1(X,[H|T],[H|T2]) :- delete1(X,T,T2).

len([],0).
len([_|T],N) :- len(T,M),N is M+1.

rlen([],0).
rlen([[]|T], N) :- rlen(T, N), !.
rlen([H|T],N) :- H \= [_|_], rlen(T,M), N is M + 1, !.
rlen([H|T],N) :- H = [_|_], rlen(H,N1), rlen(T,N2), N is N1 + N2.

sum([],0).
sum([H|T], N) :- sum(T,M), N is M + H.

avg(L, N) :- sum(L,R), len(L, W), W > 0,N is R/W.

count(_,[],0) :- !.
count(X,[X|T],N) :- !, count(X,T,M), N is M + 1.
count(X,[_|T],N) :- count(X,T,N).

% Jak jest repeat/0 to mozna zrobic po prostu repeat/3?

repeat1([], [], _).
repeat1([H|T], Y, N) :- repeat_element(H, N, R), repeat1(T, S, N), append1(R, S, Y).

repeat_element(_, 0, []) :- !.
repeat_element(E, N, [E|R]) :- N > 0, M is N - 1, repeat_element(E, M, R).

double(X, Y) :- repeat1(X, Y, 2), !.
