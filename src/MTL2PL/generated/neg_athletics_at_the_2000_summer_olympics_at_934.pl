:- include('database.pl').
athletics_at_the_2000_summer_olympics(Start,End) :- begin('athletics_at_the_2000_summer_olympics',_,_,Start), end('athletics_at_the_2000_summer_olympics',_,_,End), Start=<End.

compare_athletics_at_the_2000_summer_olympics(Dir,athletics_at_the_2000_summer_olympics(Start1,_),athletics_at_the_2000_summer_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_athletics_at_the_2000_summer_olympics([]).

generate_neg_athletics_at_the_2000_summer_olympics([(Start,End) | Tail]) :- assert(neg_athletics_at_the_2000_summer_olympics(Start,End)), generate_neg_athletics_at_the_2000_summer_olympics(Tail).

sort_athletics_at_the_2000_summer_olympics(SortedIntervals) :- findall((Start,End),athletics_at_the_2000_summer_olympics(Start,End),UnsortedIntervals), predsort(compare_athletics_at_the_2000_summer_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_athletics_at_the_2000_summer_olympics_aux() :- sort_athletics_at_the_2000_summer_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_athletics_at_the_2000_summer_olympics(NegatedIntervals).

neg_athletics_at_the_2000_summer_olympics_at_934(Res) :- setof((Start,End),neg_athletics_at_the_2000_summer_olympics(Start,End),AllINtervals), checkvalidity(934,AllINtervals,Res).

check_query() :- write('Query = neg_athletics_at_the_2000_summer_olympics_at_934'), (neg_athletics_at_the_2000_summer_olympics_at_934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_athletics_at_the_2000_summer_olympics_aux().

