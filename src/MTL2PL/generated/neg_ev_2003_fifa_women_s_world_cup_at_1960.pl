:- include('database.pl').
ev_2003_fifa_women_s_world_cup(Start,End) :- begin('ev_2003_fifa_women_s_world_cup',_,_,Start), end('ev_2003_fifa_women_s_world_cup',_,_,End), Start=<End.

compare_ev_2003_fifa_women_s_world_cup(Dir,ev_2003_fifa_women_s_world_cup(Start1,_),ev_2003_fifa_women_s_world_cup(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2003_fifa_women_s_world_cup([]).

generate_neg_ev_2003_fifa_women_s_world_cup([(Start,End) | Tail]) :- assert(neg_ev_2003_fifa_women_s_world_cup(Start,End)), generate_neg_ev_2003_fifa_women_s_world_cup(Tail).

sort_ev_2003_fifa_women_s_world_cup(SortedIntervals) :- findall((Start,End),ev_2003_fifa_women_s_world_cup(Start,End),UnsortedIntervals), predsort(compare_ev_2003_fifa_women_s_world_cup,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2003_fifa_women_s_world_cup_aux() :- sort_ev_2003_fifa_women_s_world_cup(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2003_fifa_women_s_world_cup(NegatedIntervals).

neg_ev_2003_fifa_women_s_world_cup_at_1960(Res) :- setof((Start,End),neg_ev_2003_fifa_women_s_world_cup(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2003_fifa_women_s_world_cup_at_1960'), (neg_ev_2003_fifa_women_s_world_cup_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2003_fifa_women_s_world_cup_aux().

