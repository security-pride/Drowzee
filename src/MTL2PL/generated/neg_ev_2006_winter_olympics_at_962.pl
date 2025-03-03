:- include('database.pl').
ev_2006_winter_olympics(Start,End) :- begin('ev_2006_winter_olympics',_,_,Start), end('ev_2006_winter_olympics',_,_,End), Start=<End.

compare_ev_2006_winter_olympics(Dir,ev_2006_winter_olympics(Start1,_),ev_2006_winter_olympics(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2006_winter_olympics([]).

generate_neg_ev_2006_winter_olympics([(Start,End) | Tail]) :- assert(neg_ev_2006_winter_olympics(Start,End)), generate_neg_ev_2006_winter_olympics(Tail).

sort_ev_2006_winter_olympics(SortedIntervals) :- findall((Start,End),ev_2006_winter_olympics(Start,End),UnsortedIntervals), predsort(compare_ev_2006_winter_olympics,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2006_winter_olympics_aux() :- sort_ev_2006_winter_olympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2006_winter_olympics(NegatedIntervals).

neg_ev_2006_winter_olympics_at_962(Res) :- setof((Start,End),neg_ev_2006_winter_olympics(Start,End),AllINtervals), checkvalidity(962,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2006_winter_olympics_at_962'), (neg_ev_2006_winter_olympics_at_962(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2006_winter_olympics_aux().

