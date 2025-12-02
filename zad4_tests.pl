:- [zad4].  % load the zad4.pl file

:- begin_tests(list_operations).

:- use_module(library(plunit)).

% Tests for member1/2

test(member1_first, [nondet]) :- member1(1, [1,2,3]).
test(member1_middle, [nondet]) :- member1(2, [1,2,3]).
test(member1_last, [nondet]) :- member1(3, [1,2,3]).
test(member1_not_present, [fail]) :- member1(4, [1,2,3]).
test(member1_single, [nondet]) :- member1(1, [1]).
test(member1_empty, [fail]) :- member1(1, []).
test(member1_duplicates) :-
    findall(1, member1(1, [2,1,1,3]), Results),
    Results == [1,1].
test(member1_nested, [nondet]) :- member1([1,2], [3,[1,2],4]).
test(member1_with_variables) :-
    findall(X, member1(X, [1,2,3]), Results),
    Results == [1,2,3].

% Tests for append1/3

test(append1_empty_left) :- append1([], [1,2], [1,2]).
test(append1_empty_right) :- append1([1,2], [], [1,2]).
test(append1_empty_both) :- append1([], [], []).
test(append1_normal) :- append1([1,2], [3,4], [1,2,3,4]).
test(append1_single) :- append1([1], [2], [1,2]).
test(append1_atoms) :- append1([a,b], [c,d], [a,b,c,d]).
test(append1_nested) :- append1([[1,2]], [[3,4]], [[1,2],[3,4]]).
test(append1_with_vars) :-
    append1([X,2], [3,Y], [1,2,3,4]),
    X == 1,
    Y == 4.
test(append1_mixed_types) :-
    append1([1,[a]], [b,2], [1,[a],b,2]).
test(append1_wrong_result, [fail]) :-
    append1([1,2], [3,4], [1,2,4,3]).
test(append1_wrong_length, [fail]) :-
    append1([1,2], [3,4], [1,2,3]).
test(append1_wrong_elements, [fail]) :-
    append1([1,2], [3,4], [1,3,2,4]).
test(append1_extra_element, [fail]) :-
    append1([1,2], [3], [1,2,3,4]).

% Tests for delete1/3

test(delete1_first) :- delete1(1, [1,2,3], [2,3]).
test(delete1_middle) :- delete1(2, [1,2,3], [1,3]).
test(delete1_last) :- delete1(3, [1,2,3], [1,2]).
test(delete1_not_present) :- delete1(4, [1,2,3], [1,2,3]).
test(delete1_single) :- delete1(1, [1], []).
test(delete1_empty) :- delete1(1, [], []).
test(delete1_duplicates) :- delete1(1, [1,2,1,3], [2,3]).
test(delete1_nested) :- delete1([1,2], [3,[1,2],4], [3,4]).
test(delete1_with_variables) :-
    delete1(X, [1,2,3], [2,3]),
    X == 1.
test(delete1_multiple_occurrences) :- delete1(1, [1,2,1,3,1], [2,3]).
test(delete1_wrong_result, [fail]) :- delete1(1, [1,2,3], [1,2,3]).
test(delete1_wrong_remainder, [fail]) :- delete1(1, [1,2,3], [3,2]).
test(delete1_extra_element, [fail]) :- delete1(1, [1,2,3], [2,3,4]).
test(delete1_missing_element, [fail]) :- delete1(1, [1,2,3], [2]).

% Tests for len/2

test(len_empty) :- len([], 0).
test(len_single) :- len([1], 1).
test(len_multiple) :- len([1,2,3], 3).
test(len_atoms) :- len([a,b,c], 3).
test(len_mixed) :- len([1,a,'test'], 3).
test(len_incorrect, [fail]) :- len([1,2,3], 4).

% Tests for rlen/2

test(rlen_empty) :- rlen([], 0).
test(rlen_flat) :- rlen([1,2,3], 3).
test(rlen_nested_single) :- rlen([1,[2,3],4], 4).
test(rlen_nested_multiple) :- rlen([[1,2],[3,[4,5]]], 5).
test(rlen_deeply_nested) :- rlen([[[1]]], 1).
test(rlen_mixed) :- rlen([1,[2,[3]],4], 4).
test(rlen_empty_lists) :- rlen([[],[],[]], 0).
test(rlen_mixed_depth) :- rlen([1,[2,[]],[3,[4,[5]]]], 5).
test(rlen_with_atoms_and_lists) :-
    rlen([a,[b,c],[[d]]], 4).
test(rlen_with_variables) :-
    X = a, Y = b, Z = c,
    rlen([X,[Y,Z]], 3).
test(rlen_wrong_count, [fail]) :-
    rlen([1,[2,3],4], 5).
test(rlen_wrong_nested_count, [fail]) :-
    rlen([[1,2],[3,[4,5]]], 4).
test(rlen_wrong_empty_count, [fail]) :-
    rlen([[],[],[]], 3).
test(rlen_wrong_deep_count, [fail]) :-
    rlen([1,[2,[3]],4], 5).

% Tests for sum/2

test(sum_empty) :- sum([], 0).
test(sum_single) :- sum([5], 5).
test(sum_multiple) :- sum([1,2,3], 6).
test(sum_negative) :- sum([-1,2,-3], -2).
test(sum_zero) :- sum([0,0,0], 0).
test(sum_incorrect, [fail]) :- sum([1,2,3], 7).
test(sum_floats) :- sum([1.5,2.5], 4.0).
test(sum_mixed_numbers) :-
    sum([1, 2.5, -3.7, 0.2], Sum),
    abs(Sum - 0) < 0.000001.

% Tests for avg/2

test(avg_simple) :- avg([2,2,2], 2).
test(avg_integers) :- avg([1,2,3], 2).
test(avg_float) :-
    avg([1,2,4], A),
    abs(A - 2.333333333333333) < 0.000001.
test(avg_negative) :- avg([-1,0,1], 0).
test(avg_single) :- avg([5], 5).
test(avg_incorrect, [fail]) :- avg([1,2,3], 2.5).
test(avg_empty, [fail]) :- avg([], _).
test(avg_all_same) :- avg([5,5,5,5], 5).
test(avg_precision) :-
    avg([1,2,3,4,5], Avg),
    abs(Avg - 3.0) < 0.000001.

% Tests for count/3

test(count_empty) :- count(1, [], 0).
test(count_none) :- count(1, [2,3,4], 0).
test(count_single) :- count(1, [1], 1).
test(count_multiple) :- count(1, [1,2,1,3,1], 3).
test(count_all) :- count(1, [1,1,1], 3).
test(count_incorrect, [fail]) :- count(1, [1,1,1], 2).
test(count_nested) :- count([1,2], [3,[1,2],4,[1,2]], 2).
test(count_negative, [fail]) :- count(1, [1,1,1], -1).
test(count_too_large, [fail]) :- count(1, [1,2,1], 4).
test(count_float, [fail]) :- count(1, [1,1,1], 2.5).
test(count_wrong_type, [fail]) :- count(1, [1,1,1], a).

% Tests for double/2

test(double_empty) :- double([], []).
test(double_single) :- double([1], [1,1]).
test(double_multiple) :- double([1,2], [1,1,2,2]).
test(double_atoms) :- double([a,b], [a,a,b,b]).
test(double_incorrect, [fail]) :- double([1,2], [1,2,1,2]).
test(double_wrong_length, [fail]) :- double([1,2], [1,1,2]).
test(double_wrong_elements, [fail]) :- double([1,2], [1,1,3,3]).
test(double_extra_elements, [fail]) :- double([1], [1,1,1]).
test(double_missing_elements, [fail]) :- double([1,2], [1,2]).
test(double_wrong_order, [fail]) :- double([1,2], [2,2,1,1]).

% Tests for repeat1/3

test(repeat_empty) :- repeat1([], [], 3).
test(repeat_single) :- repeat1([1], [1,1,1], 3).
test(repeat_multiple) :- repeat1([1,2], [1,1,1,2,2,2], 3).
test(repeat_zero) :- repeat1([1,2], [], 0).
test(repeat_one) :- repeat1([1,2], [1,2], 1).
test(repeat_incorrect, [fail]) :- repeat1([1,2], [1,1,2], 2).
test(repeat_negative, [fail]) :- repeat1([1,2], _, -1).
test(repeat_float, [fail]) :- repeat1([1,2], _, 2.5).
test(repeat_with_nested_lists) :-
    repeat1([[1,2]], [[1,2],[1,2]], 2).
test(repeat_with_variables) :-
    repeat1([X,2], [1,1,2,2], 2),
    X == 1.
test(repeat_wrong_count, [fail]) :-
    repeat1([1,2], [1,1,2,2], 3).
test(repeat_wrong_elements, [fail]) :-
    repeat1([1,2], [1,1,3,3], 2).
test(repeat_wrong_order, [fail]) :-
    repeat1([1,2], [2,2,1,1], 2).
test(repeat_missing_elements, [fail]) :-
    repeat1([1,2], [1,1], 2).
test(repeat_extra_elements, [fail]) :-
    repeat1([1], [1,1,1], 2).
test(repeat_wrong_structure, [fail]) :-
    repeat1([[1]], [[1,1]], 2).

:- end_tests(list_operations).


