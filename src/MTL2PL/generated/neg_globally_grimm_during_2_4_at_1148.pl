:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

globally_grimm_during_2_4(Start,End) :- grimm(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

compare_globally_grimm_during_2_4(Dir,globally_grimm_during_2_4(Start1,_),globally_grimm_during_2_4(Start2,_)) :- Start1=<Start2.

generate_neg_globally_grimm_during_2_4([]).

generate_neg_globally_grimm_during_2_4([(Start,End) | Tail]) :- assert(neg_globally_grimm_during_2_4(Start,End)), generate_neg_globally_grimm_during_2_4(Tail).

sort_globally_grimm_during_2_4(SortedIntervals) :- findall((Start,End),globally_grimm_during_2_4(Start,End),UnsortedIntervals), predsort(compare_globally_grimm_during_2_4,UnsortedIntervals,SortedIntervals).

generate_neg_globally_grimm_during_2_4_aux() :- sort_globally_grimm_during_2_4(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_grimm_during_2_4(NegatedIntervals).

neg_globally_grimm_during_2_4_at_1148(Res) :- setof((Start,End),neg_globally_grimm_during_2_4(Start,End),AllINtervals), checkvalidity(1148,AllINtervals,Res).

check_query() :- write('Query = neg_globally_grimm_during_2_4_at_1148'), (neg_globally_grimm_during_2_4_at_1148(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_grimm_during_2_4_aux().

