:- include('database.pl').
french_invasion_of_egypt_and_syria(Start,End) :- begin('french_invasion_of_egypt_and_syria',_,_,Start), end('french_invasion_of_egypt_and_syria',_,_,End), Start=<End.

globally_french_invasion_of_egypt_and_syria_during_1_2(Start,End) :- french_invasion_of_egypt_and_syria(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_french_invasion_of_egypt_and_syria_during_1_2_at_1798(Res) :- setof((Start,End),globally_french_invasion_of_egypt_and_syria_during_1_2(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = globally_french_invasion_of_egypt_and_syria_during_1_2_at_1798'), (globally_french_invasion_of_egypt_and_syria_during_1_2_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).

