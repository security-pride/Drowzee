:- include('database.pl').
ev_2011_military_intervention_in_libya(Start,End) :- begin('ev_2011_military_intervention_in_libya',_,_,Start), end('ev_2011_military_intervention_in_libya',_,_,End), Start=<End.

next_ev_2011_military_intervention_in_libya(Start,End) :- ev_2011_military_intervention_in_libya(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2011_military_intervention_in_libya_at_2010(Res) :- setof((Start,End),next_ev_2011_military_intervention_in_libya(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = next_ev_2011_military_intervention_in_libya_at_2010'), (next_ev_2011_military_intervention_in_libya_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

