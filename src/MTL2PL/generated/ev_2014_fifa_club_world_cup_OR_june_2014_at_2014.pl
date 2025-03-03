:- include('database.pl').
ev_2014_fifa_club_world_cup(Start,End) :- begin('ev_2014_fifa_club_world_cup',_,_,Start), end('ev_2014_fifa_club_world_cup',_,_,End), Start=<End.

june_2014(Start,End) :- begin('june_2014',_,_,Start), end('june_2014',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_club_world_cup_OR_june_2014([]) :- assert(ev_2014_fifa_club_world_cup_OR_june_2014(-1,-1)).

generate_facts_ev_2014_fifa_club_world_cup_OR_june_2014([(Start,End) | Tail]) :- assert(ev_2014_fifa_club_world_cup_OR_june_2014(Start,End)), generate_facts_ev_2014_fifa_club_world_cup_OR_june_2014(Tail).

ev_2014_fifa_club_world_cup_OR_june_2014_aux() :- findall((Start,End),ev_2014_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),june_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_club_world_cup_OR_june_2014(Interval).

ev_2014_fifa_club_world_cup_OR_june_2014_at_2014(Res) :- setof((Start,End),ev_2014_fifa_club_world_cup_OR_june_2014(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_club_world_cup_OR_june_2014_at_2014'), (ev_2014_fifa_club_world_cup_OR_june_2014_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_club_world_cup_OR_june_2014_aux().

