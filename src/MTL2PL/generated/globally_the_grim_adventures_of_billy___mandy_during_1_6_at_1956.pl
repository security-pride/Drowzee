:- include('database.pl').
the_grim_adventures_of_billy___mandy(Start,End) :- begin('the_grim_adventures_of_billy___mandy',_,_,Start), end('the_grim_adventures_of_billy___mandy',_,_,End), Start=<End.

globally_the_grim_adventures_of_billy___mandy_during_1_6(Start,End) :- the_grim_adventures_of_billy___mandy(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

globally_the_grim_adventures_of_billy___mandy_during_1_6_at_1956(Res) :- setof((Start,End),globally_the_grim_adventures_of_billy___mandy_during_1_6(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = globally_the_grim_adventures_of_billy___mandy_during_1_6_at_1956'), (globally_the_grim_adventures_of_billy___mandy_during_1_6_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).

