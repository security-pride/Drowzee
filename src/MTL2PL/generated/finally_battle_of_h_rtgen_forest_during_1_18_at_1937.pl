:- include('database.pl').
battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

finally_battle_of_h_rtgen_forest_during_1_18(Start,End) :- battle_of_h_rtgen_forest(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_battle_of_h_rtgen_forest_during_1_18_at_1937(Res) :- setof((Start,End),finally_battle_of_h_rtgen_forest_during_1_18(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_h_rtgen_forest_during_1_18_at_1937'), (finally_battle_of_h_rtgen_forest_during_1_18_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).

