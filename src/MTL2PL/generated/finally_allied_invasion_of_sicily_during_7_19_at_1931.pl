:- include('database.pl').
allied_invasion_of_sicily(Start,End) :- begin('allied_invasion_of_sicily',_,_,Start), end('allied_invasion_of_sicily',_,_,End), Start=<End.

finally_allied_invasion_of_sicily_during_7_19(Start,End) :- allied_invasion_of_sicily(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_allied_invasion_of_sicily_during_7_19_at_1931(Res) :- setof((Start,End),finally_allied_invasion_of_sicily_during_7_19(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = finally_allied_invasion_of_sicily_during_7_19_at_1931'), (finally_allied_invasion_of_sicily_during_7_19_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

