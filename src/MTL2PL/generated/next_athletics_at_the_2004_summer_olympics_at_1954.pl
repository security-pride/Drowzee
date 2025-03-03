:- include('database.pl').
athletics_at_the_2004_summer_olympics(Start,End) :- begin('athletics_at_the_2004_summer_olympics',_,_,Start), end('athletics_at_the_2004_summer_olympics',_,_,End), Start=<End.

next_athletics_at_the_2004_summer_olympics(Start,End) :- athletics_at_the_2004_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_athletics_at_the_2004_summer_olympics_at_1954(Res) :- setof((Start,End),next_athletics_at_the_2004_summer_olympics(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = next_athletics_at_the_2004_summer_olympics_at_1954'), (next_athletics_at_the_2004_summer_olympics_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

