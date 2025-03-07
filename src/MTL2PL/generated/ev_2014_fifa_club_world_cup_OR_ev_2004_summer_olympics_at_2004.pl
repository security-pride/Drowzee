:- include('database.pl').
ev_2014_fifa_club_world_cup(Start,End) :- begin('ev_2014_fifa_club_world_cup',_,_,Start), end('ev_2014_fifa_club_world_cup',_,_,End), Start=<End.

ev_2004_summer_olympics(Start,End) :- begin('ev_2004_summer_olympics',_,_,Start), end('ev_2004_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics([]) :- assert(ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics(-1,-1)).

generate_facts_ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics([(Start,End) | Tail]) :- assert(ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics(Start,End)), generate_facts_ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics(Tail).

ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics_aux() :- findall((Start,End),ev_2014_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),ev_2004_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics(Interval).

ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics_at_2004(Res) :- setof((Start,End),ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics_at_2004'), (ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_club_world_cup_OR_ev_2004_summer_olympics_aux().

