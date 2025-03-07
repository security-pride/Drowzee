:- include('database.pl').
ottoman_interregnum(Start,End) :- begin('ottoman_interregnum',_,_,Start), end('ottoman_interregnum',_,_,End), Start=<End.

finally_ottoman_interregnum_during_1_15(Start,End) :- ottoman_interregnum(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

compare_finally_ottoman_interregnum_during_1_15(Dir,finally_ottoman_interregnum_during_1_15(Start1,_),finally_ottoman_interregnum_during_1_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ottoman_interregnum_during_1_15([]).

generate_neg_finally_ottoman_interregnum_during_1_15([(Start,End) | Tail]) :- assert(neg_finally_ottoman_interregnum_during_1_15(Start,End)), generate_neg_finally_ottoman_interregnum_during_1_15(Tail).

sort_finally_ottoman_interregnum_during_1_15(SortedIntervals) :- findall((Start,End),finally_ottoman_interregnum_during_1_15(Start,End),UnsortedIntervals), predsort(compare_finally_ottoman_interregnum_during_1_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ottoman_interregnum_during_1_15_aux() :- sort_finally_ottoman_interregnum_during_1_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ottoman_interregnum_during_1_15(NegatedIntervals).

neg_finally_ottoman_interregnum_during_1_15_at_1613(Res) :- setof((Start,End),neg_finally_ottoman_interregnum_during_1_15(Start,End),AllINtervals), checkvalidity(1613,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ottoman_interregnum_during_1_15_at_1613'), (neg_finally_ottoman_interregnum_during_1_15_at_1613(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ottoman_interregnum_during_1_15_aux().

