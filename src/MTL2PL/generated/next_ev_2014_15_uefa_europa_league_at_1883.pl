:- include('database.pl').
ev_2014_15_uefa_europa_league(Start,End) :- begin('ev_2014_15_uefa_europa_league',_,_,Start), end('ev_2014_15_uefa_europa_league',_,_,End), Start=<End.

next_ev_2014_15_uefa_europa_league(Start,End) :- ev_2014_15_uefa_europa_league(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_15_uefa_europa_league_at_1883(Res) :- setof((Start,End),next_ev_2014_15_uefa_europa_league(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_15_uefa_europa_league_at_1883'), (next_ev_2014_15_uefa_europa_league_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

