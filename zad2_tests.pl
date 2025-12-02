:- [zad2]. % load the zad2.pl file

test_son :-
    son(bob, pam),
    son(bob, tom),
    son(jim, pat),
    son(jim, joe),
    \+ son(bob, bob),
    \+ son(ann, bob),
    \+ son(john, mary),
    \+ son(bob, liz).

test_granddaughter :-
    granddaughter(ann, tom),
    granddaughter(ann, pam),
    granddaughter(pat, tom),
    granddaughter(pat, pam),
    \+ granddaughter(jim, tom),
    \+ granddaughter(liz, bob),
    \+ granddaughter(mary, john).

test_aunt :-
    aunt(liz, ann),
    aunt(liz, pat),
    \+ aunt(tom, ann),
    \+ aunt(pam, ann),
    \+ aunt(mary, john),

test_partner :-
    partner(pam, tom),
    partner(tom, pam),
    partner(pat, joe),
    partner(joe, pat),
    \+ partner(bob, bob),
    \+ partner(tom, pat),
    \+ partner(mary, john).

run_all_tests :-
    test_son,
    test_granddaughter,
    test_aunt,
    test_partner.