:- include('database.pl').
war_of_the_league_of_cambrai(Start,End) :- begin('war_of_the_league_of_cambrai',_,_,Start), end('war_of_the_league_of_cambrai',_,_,End), Start=<End.

finally_war_of_the_league_of_cambrai_during_8_16(Start,End) :- war_of_the_league_of_cambrai(Start1,End1), (Start1-16)=<(End1-8), Start is (Start1-16), End is (End1-8), Start=<End.

compare_finally_war_of_the_league_of_cambrai_during_8_16(Dir,finally_war_of_the_league_of_cambrai_during_8_16(Start1,_),finally_war_of_the_league_of_cambrai_during_8_16(Start2,_)) :- Start1=<Start2.

generate_neg_finally_war_of_the_league_of_cambrai_during_8_16([]).

generate_neg_finally_war_of_the_league_of_cambrai_during_8_16([(Start,End) | Tail]) :- assert(neg_finally_war_of_the_league_of_cambrai_during_8_16(Start,End)), generate_neg_finally_war_of_the_league_of_cambrai_during_8_16(Tail).

sort_finally_war_of_the_league_of_cambrai_during_8_16(SortedIntervals) :- findall((Start,End),finally_war_of_the_league_of_cambrai_during_8_16(Start,End),UnsortedIntervals), predsort(compare_finally_war_of_the_league_of_cambrai_during_8_16,UnsortedIntervals,SortedIntervals).

generate_neg_finally_war_of_the_league_of_cambrai_during_8_16_aux() :- sort_finally_war_of_the_league_of_cambrai_during_8_16(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_war_of_the_league_of_cambrai_during_8_16(NegatedIntervals).

neg_finally_war_of_the_league_of_cambrai_during_8_16_at_1231(Res) :- setof((Start,End),neg_finally_war_of_the_league_of_cambrai_during_8_16(Start,End),AllINtervals), checkvalidity(1231,AllINtervals,Res).

check_query() :- write('Query = neg_finally_war_of_the_league_of_cambrai_during_8_16_at_1231'), (neg_finally_war_of_the_league_of_cambrai_during_8_16_at_1231(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_war_of_the_league_of_cambrai_during_8_16_aux().

