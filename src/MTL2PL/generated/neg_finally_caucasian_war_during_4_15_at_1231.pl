:- include('database.pl').
caucasian_war(Start,End) :- begin('caucasian_war',_,_,Start), end('caucasian_war',_,_,End), Start=<End.

finally_caucasian_war_during_4_15(Start,End) :- caucasian_war(Start1,End1), (Start1-15)=<(End1-4), Start is (Start1-15), End is (End1-4), Start=<End.

compare_finally_caucasian_war_during_4_15(Dir,finally_caucasian_war_during_4_15(Start1,_),finally_caucasian_war_during_4_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_caucasian_war_during_4_15([]).

generate_neg_finally_caucasian_war_during_4_15([(Start,End) | Tail]) :- assert(neg_finally_caucasian_war_during_4_15(Start,End)), generate_neg_finally_caucasian_war_during_4_15(Tail).

sort_finally_caucasian_war_during_4_15(SortedIntervals) :- findall((Start,End),finally_caucasian_war_during_4_15(Start,End),UnsortedIntervals), predsort(compare_finally_caucasian_war_during_4_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_caucasian_war_during_4_15_aux() :- sort_finally_caucasian_war_during_4_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_caucasian_war_during_4_15(NegatedIntervals).

neg_finally_caucasian_war_during_4_15_at_1231(Res) :- setof((Start,End),neg_finally_caucasian_war_during_4_15(Start,End),AllINtervals), checkvalidity(1231,AllINtervals,Res).

check_query() :- write('Query = neg_finally_caucasian_war_during_4_15_at_1231'), (neg_finally_caucasian_war_during_4_15_at_1231(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_caucasian_war_during_4_15_aux().

