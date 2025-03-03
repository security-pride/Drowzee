:- include('database.pl').
spanish_colonization_of_the_americas(Start,End) :- begin('spanish_colonization_of_the_americas',_,_,Start), end('spanish_colonization_of_the_americas',_,_,End), Start=<End.

meiji_restoration(Start,End) :- begin('meiji_restoration',_,_,Start), end('meiji_restoration',_,_,End), Start=<End.

spanish_colonization_of_the_americas_last_till_323_328(Start,End) :- spanish_colonization_of_the_americas(Start1,End1), (End1-Start1)>=323, Start is (Start1+323), End is (End1+1).

spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328_overlap(Start,End) :- spanish_colonization_of_the_americas_last_till_323_328(Start1,End1), meiji_restoration(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328(Start,End) :- spanish_colonization_of_the_americas(W1,_), spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328_overlap(Start1,End1), Start is max((Start1-328),W1), End is (End1-323), Start=<End.

spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328_at_1556(Res) :- setof((Start,End),spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328(Start,End),AllINtervals), checkvalidity(1556,AllINtervals,Res).

check_query() :- write('Query = spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328_at_1556'), (spanish_colonization_of_the_americas_until_meiji_restoration_during_323_328_at_1556(true) -> write('\nRes   = true');write('\nRes   = false')).

