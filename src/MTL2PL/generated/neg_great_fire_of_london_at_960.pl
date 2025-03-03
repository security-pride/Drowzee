:- include('database.pl').
great_fire_of_london(Start,End) :- begin('great_fire_of_london',_,_,Start), end('great_fire_of_london',_,_,End), Start=<End.

compare_great_fire_of_london(Dir,great_fire_of_london(Start1,_),great_fire_of_london(Start2,_)) :- Start1=<Start2.

generate_neg_great_fire_of_london([]).

generate_neg_great_fire_of_london([(Start,End) | Tail]) :- assert(neg_great_fire_of_london(Start,End)), generate_neg_great_fire_of_london(Tail).

sort_great_fire_of_london(SortedIntervals) :- findall((Start,End),great_fire_of_london(Start,End),UnsortedIntervals), predsort(compare_great_fire_of_london,UnsortedIntervals,SortedIntervals).

generate_neg_great_fire_of_london_aux() :- sort_great_fire_of_london(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_great_fire_of_london(NegatedIntervals).

neg_great_fire_of_london_at_960(Res) :- setof((Start,End),neg_great_fire_of_london(Start,End),AllINtervals), checkvalidity(960,AllINtervals,Res).

check_query() :- write('Query = neg_great_fire_of_london_at_960'), (neg_great_fire_of_london_at_960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_great_fire_of_london_aux().

