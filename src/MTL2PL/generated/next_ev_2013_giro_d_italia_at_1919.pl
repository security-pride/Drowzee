:- include('database.pl').
ev_2013_giro_d_italia(Start,End) :- begin('ev_2013_giro_d_italia',_,_,Start), end('ev_2013_giro_d_italia',_,_,End), Start=<End.

next_ev_2013_giro_d_italia(Start,End) :- ev_2013_giro_d_italia(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2013_giro_d_italia_at_1919(Res) :- setof((Start,End),next_ev_2013_giro_d_italia(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = next_ev_2013_giro_d_italia_at_1919'), (next_ev_2013_giro_d_italia_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

