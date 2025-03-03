:- include('database.pl').
ev_2010_fifa_world_cup_group_e(Start,End) :- begin('ev_2010_fifa_world_cup_group_e',_,_,Start), end('ev_2010_fifa_world_cup_group_e',_,_,End), Start=<End.

next_ev_2010_fifa_world_cup_group_e(Start,End) :- ev_2010_fifa_world_cup_group_e(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2010_fifa_world_cup_group_e_at_2009(Res) :- setof((Start,End),next_ev_2010_fifa_world_cup_group_e(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = next_ev_2010_fifa_world_cup_group_e_at_2009'), (next_ev_2010_fifa_world_cup_group_e_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

