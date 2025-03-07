:- include('database.pl').
ev_2013_14_premier_league(Start,End) :- begin('ev_2013_14_premier_league',_,_,Start), end('ev_2013_14_premier_league',_,_,End), Start=<End.

mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

generate_facts_ev_2013_14_premier_league_AND_mr__bean([]) :- assert(ev_2013_14_premier_league_AND_mr__bean(-1,-1)).

generate_facts_ev_2013_14_premier_league_AND_mr__bean([(Start,End) | Tail]) :- assert(ev_2013_14_premier_league_AND_mr__bean(Start,End)), generate_facts_ev_2013_14_premier_league_AND_mr__bean(Tail).

ev_2013_14_premier_league_AND_mr__bean_aux() :- findall((Start,End),ev_2013_14_premier_league(Start,End),Interval1), findall((Start,End),mr__bean(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_premier_league_AND_mr__bean(Interval).

ev_2013_14_premier_league_AND_mr__bean_at_1882(Res) :- setof((Start,End),ev_2013_14_premier_league_AND_mr__bean(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_premier_league_AND_mr__bean_at_1882'), (ev_2013_14_premier_league_AND_mr__bean_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_premier_league_AND_mr__bean_aux().

