:- include('database.pl').
ev_2016_17_la_liga(Start,End) :- begin('ev_2016_17_la_liga',_,_,Start), end('ev_2016_17_la_liga',_,_,End), Start=<End.

next_ev_2016_17_la_liga(Start,End) :- ev_2016_17_la_liga(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2016_17_la_liga_at_1896(Res) :- setof((Start,End),next_ev_2016_17_la_liga(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = next_ev_2016_17_la_liga_at_1896'), (next_ev_2016_17_la_liga_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).

