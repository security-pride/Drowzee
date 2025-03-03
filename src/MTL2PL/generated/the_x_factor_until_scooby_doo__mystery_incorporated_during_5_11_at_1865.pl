:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

the_x_factor_last_till_5_11(Start,End) :- the_x_factor(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11_overlap(Start,End) :- the_x_factor_last_till_5_11(Start1,End1), scooby_doo__mystery_incorporated(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11(Start,End) :- the_x_factor(W1,_), the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-5), Start=<End.

the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11_at_1865(Res) :- setof((Start,End),the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11_at_1865'), (the_x_factor_until_scooby_doo__mystery_incorporated_during_5_11_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

