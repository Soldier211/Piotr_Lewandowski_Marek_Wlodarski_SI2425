:- [zad3].  % load the zad3.pl file

:- begin_tests(arithmetic_operations).

:- use_module(library(plunit)).

% Tests for isnumber/1

test(isnumber_zero) :- isnumber(zero).
test(isnumber_positive) :- isnumber(s(zero)).
test(isnumber_larger) :- isnumber(s(s(zero))).
test(isnumber_invalid, [fail]) :- isnumber(invalid).

% Tests for isequal/2

test(equal_zero) :- isequal(zero, zero).
test(equal_positive) :- isequal(s(zero), s(zero)).
test(equal_larger) :- isequal(s(s(zero)), s(s(zero))).
test(not_equal, [fail]) :- isequal(zero, s(zero)).

% Tests for lessthanequal/2

test(lessthanequal_equal) :- lessthanequal(zero, zero).
test(lessthanequal_true) :- lessthanequal(zero, s(zero)).
test(lessthanequal_larger) :- lessthanequal(s(zero), s(s(zero))).
test(lessthanequal_false, [fail]) :- lessthanequal(s(zero), zero).

% Tests for lessthan/2

test(lessthan_basic) :- lessthan(zero, s(zero)).
test(lessthan_larger) :- lessthan(s(zero), s(s(zero))).
test(lessthan_equal, [fail]) :- lessthan(zero, zero).
test(lessthan_false, [fail]) :- lessthan(s(zero), zero).

% Tests for add/3

test(add_zero_left) :- add(zero, s(zero), s(zero)).
test(add_zero_right) :- add(s(zero), zero, s(zero)).
test(add_positive) :- add(s(zero), s(zero), s(s(zero))).
test(add_larger) :- add(s(s(zero)), s(zero), s(s(s(zero)))).
test(add_invalid_first, [fail]) :- add(invalid, s(zero), s(zero)).
test(add_invalid_second, [fail]) :- add(s(zero), invalid, s(s(zero))).
test(add_invalid_result, [fail]) :- add(s(zero), s(zero), invalid).
test(add_wrong_result, [fail]) :- add(s(zero), s(zero), s(zero)).

% Tests for odd/1

test(odd_one) :- odd(s(zero)).
test(odd_three) :- odd(s(s(s(zero)))).
test(odd_zero, [fail]) :- odd(zero).
test(odd_two, [fail]) :- odd(s(s(zero))).

% Tests for even/1

test(even_zero) :- even(zero).
test(even_two) :- even(s(s(zero))).
test(even_one, [fail]) :- even(s(zero)).
test(even_three, [fail]) :- even(s(s(s(zero)))).

% Tests for times/3

test(times_zero_left) :- times(zero, s(zero), zero).
test(times_zero_right) :- times(s(zero), zero, zero).
test(times_one) :- times(s(zero), s(zero), s(zero)).
test(times_two_three) :-
    times(s(s(zero)), s(s(s(zero))), s(s(s(s(s(s(zero))))))).
test(times_invalid_first, [fail]) :- times(invalid, s(zero), zero).
test(times_invalid_second, [fail]) :- times(s(zero), invalid, zero).
test(times_invalid_result, [fail]) :- times(s(zero), s(zero), invalid).
test(times_wrong_result, [fail]) :- times(s(s(zero)), s(s(zero)), s(s(s(zero)))).

% Tests for quotient/3

test(quotient_zero) :- quotient(zero, s(zero), zero).
test(quotient_by_one) :- quotient(s(s(zero)), s(zero), s(s(zero))).
test(quotient_exact) :- quotient(s(s(s(s(zero)))), s(s(zero)), s(s(zero))).
test(quotient_by_zero) :- (quotient(s(zero), zero, _), !) ; \+ quotient(s(zero), zero, _).
test(quotient_four_by_three) :-
    quotient(s(s(s(s(zero)))), s(s(s(zero))), s(zero)).
test(quotient_four_by_one) :-
    quotient(s(s(s(s(zero)))), s(zero), s(s(s(s(zero))))).
test(quotient_two_by_three) :-
    (quotient(s(s(zero)), s(s(s(zero))), zero), !) ; \+ quotient(s(s(zero)), s(s(s(zero))), _)).
test(quotient_invalid_dividend, [fail]) :- quotient(invalid, s(zero), zero).
test(quotient_invalid_divisor, [fail]) :- quotient(s(zero), invalid, zero).
test(quotient_invalid_result, [fail]) :- quotient(s(s(zero)), s(zero), invalid).
test(quotient_wrong_result, [fail]) :- quotient(s(s(s(s(zero)))), s(s(zero)), s(zero)).

% Tests for remainder/3

test(remainder_zero) :- remainder(zero, s(zero), zero).
test(remainder_smaller) :- remainder(s(zero), s(s(zero)), s(zero)).
test(remainder_exact) :- remainder(s(s(s(s(zero)))), s(s(zero)), zero).
test(remainder_by_zero) :- remainder(s(zero), zero, _).
test(remainder_two_by_two) :-
    remainder(s(s(zero)), s(s(zero)), zero).
test(remainder_invalid_dividend, [fail]) :- remainder(invalid, s(zero), zero).
test(remainder_invalid_divisor, [fail]) :- remainder(s(zero), invalid, zero).
test(remainder_invalid_result, [fail]) :- remainder(s(s(zero)), s(zero), invalid).
test(remainder_wrong_result, [fail]) :- remainder(s(s(s(zero))), s(s(zero)), s(s(zero))).

% Tests for fact/2

test(fact_zero) :- fact(zero, s(zero)).
test(fact_one) :- fact(s(zero), s(zero)).
test(fact_two) :- fact(s(s(zero)), s(s(zero))).
test(fact_three) :-
    fact(s(s(s(zero))), s(s(s(s(s(s(zero))))))).
test(fact_invalid_input, [fail]) :- fact(invalid, s(zero)).
test(fact_negative, [fail]) :- fact(negative, _).
test(fact_wrong_result, [fail]) :- fact(s(s(zero)), s(s(s(zero)))).
test(fact_zero_wrong, [fail]) :- fact(zero, zero).

% Tests for fibonacci/2

test(fibonacci_zero) :- fibonacci(zero, zero).
test(fibonacci_one) :- fibonacci(s(zero), s(zero)).
test(fibonacci_two) :- fibonacci(s(s(zero)), s(zero)).
test(fibonacci_three) :- fibonacci(s(s(s(zero))), s(s(zero))).
test(fibonacci_invalid_input, [fail]) :- fibonacci(invalid, _).
test(fibonacci_negative, [fail]) :- fibonacci(negative, _).
test(fibonacci_wrong_result, [fail]) :- fibonacci(s(s(zero)), s(s(zero))).
test(fibonacci_zero_wrong, [fail]) :- fibonacci(zero, s(zero)).

% Tests for shownum/2

test(shownum_zero) :- shownum(zero, 0).
test(shownum_one) :- shownum(s(zero), 1).
test(shownum_three) :- shownum(s(s(s(zero))), 3).
test(shownum_invalid, [fail]) :- shownum(zer, _).
test(shownum_wrong_result, [fail]) :- shownum(s(zero), 2).
test(shownum_negative_result, [fail]) :- shownum(s(zero), -1).
test(shownum_invalid_second, [fail]) :- shownum(s(zero), invalid).

:- end_tests(arithmetic_operations).


