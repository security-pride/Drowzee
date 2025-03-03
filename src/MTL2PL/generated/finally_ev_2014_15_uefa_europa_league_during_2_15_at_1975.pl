:- include('database.pl').
ev_2014_15_uefa_europa_league(Start,End) :- begin('ev_2014_15_uefa_europa_league',_,_,Start), end('ev_2014_15_uefa_europa_league',_,_,End), Start=<End.

finally_ev_2014_15_uefa_europa_league_during_2_15(Start,End) :- ev_2014_15_uefa_europa_league(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

finally_ev_2014_15_uefa_europa_league_during_2_15_at_1975(Res) :- setof((Start,End),finally_ev_2014_15_uefa_europa_league_during_2_15(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_15_uefa_europa_league_during_2_15_at_1975'), (finally_ev_2014_15_uefa_europa_league_during_2_15_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).

