:- include('database.pl').
two_and_a_half_men(Start,End) :- begin('two_and_a_half_men',_,_,Start), end('two_and_a_half_men',_,_,End), Start=<End.

jericho(Start,End) :- begin('jericho',_,_,Start), end('jericho',_,_,End), Start=<End.

two_and_a_half_men_last_till_2_6(Start,End) :- two_and_a_half_men(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

two_and_a_half_men_until_jericho_during_2_6_overlap(Start,End) :- two_and_a_half_men_last_till_2_6(Start1,End1), jericho(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

two_and_a_half_men_until_jericho_during_2_6(Start,End) :- two_and_a_half_men(W1,_), two_and_a_half_men_until_jericho_during_2_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-2), Start=<End.

two_and_a_half_men_until_jericho_during_2_6_at_1963(Res) :- setof((Start,End),two_and_a_half_men_until_jericho_during_2_6(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = two_and_a_half_men_until_jericho_during_2_6_at_1963'), (two_and_a_half_men_until_jericho_during_2_6_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).

