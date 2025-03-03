:- include('database.pl').
ev_2006_winter_paralympics(Start,End) :- begin('ev_2006_winter_paralympics',_,_,Start), end('ev_2006_winter_paralympics',_,_,End), Start=<End.

compare_ev_2006_winter_paralympics(Dir,ev_2006_winter_paralympics(Start1,_),ev_2006_winter_paralympics(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2006_winter_paralympics([]).

generate_neg_ev_2006_winter_paralympics([(Start,End) | Tail]) :- assert(neg_ev_2006_winter_paralympics(Start,End)), generate_neg_ev_2006_winter_paralympics(Tail).

sort_ev_2006_winter_paralympics(SortedIntervals) :- findall((Start,End),ev_2006_winter_paralympics(Start,End),UnsortedIntervals), predsort(compare_ev_2006_winter_paralympics,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2006_winter_paralympics_aux() :- sort_ev_2006_winter_paralympics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2006_winter_paralympics(NegatedIntervals).

neg_ev_2006_winter_paralympics_at_1733(Res) :- setof((Start,End),neg_ev_2006_winter_paralympics(Start,End),AllINtervals), checkvalidity(1733,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2006_winter_paralympics_at_1733'), (neg_ev_2006_winter_paralympics_at_1733(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2006_winter_paralympics_aux().

