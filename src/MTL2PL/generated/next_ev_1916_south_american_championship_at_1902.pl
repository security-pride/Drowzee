:- include('database.pl').
ev_1916_south_american_championship(Start,End) :- begin('ev_1916_south_american_championship',_,_,Start), end('ev_1916_south_american_championship',_,_,End), Start=<End.

next_ev_1916_south_american_championship(Start,End) :- ev_1916_south_american_championship(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1916_south_american_championship_at_1902(Res) :- setof((Start,End),next_ev_1916_south_american_championship(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = next_ev_1916_south_american_championship_at_1902'), (next_ev_1916_south_american_championship_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

