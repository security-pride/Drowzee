:- include('database.pl').
ranger_program(Start,End) :- begin('ranger_program',_,_,Start), end('ranger_program',_,_,End), Start=<End.

finally_ranger_program_during_2_13(Start,End) :- ranger_program(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

compare_finally_ranger_program_during_2_13(Dir,finally_ranger_program_during_2_13(Start1,_),finally_ranger_program_during_2_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ranger_program_during_2_13([]).

generate_neg_finally_ranger_program_during_2_13([(Start,End) | Tail]) :- assert(neg_finally_ranger_program_during_2_13(Start,End)), generate_neg_finally_ranger_program_during_2_13(Tail).

sort_finally_ranger_program_during_2_13(SortedIntervals) :- findall((Start,End),finally_ranger_program_during_2_13(Start,End),UnsortedIntervals), predsort(compare_finally_ranger_program_during_2_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ranger_program_during_2_13_aux() :- sort_finally_ranger_program_during_2_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ranger_program_during_2_13(NegatedIntervals).

neg_finally_ranger_program_during_2_13_at_274(Res) :- setof((Start,End),neg_finally_ranger_program_during_2_13(Start,End),AllINtervals), checkvalidity(274,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ranger_program_during_2_13_at_274'), (neg_finally_ranger_program_during_2_13_at_274(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ranger_program_during_2_13_aux().

