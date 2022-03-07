#Takes in the course number of a Computer Science course and performs a get on the n2_search form to find the associated course

#URL used https://catalog.fullerton.edu/search_advanced.php?cur_cat_oid=70&search_database=Search&search_db=Search&cpage=1&ecpage=1&ppage=1&spage=1&tpage=1&location=33&filter%5Bkeyword%5D=CPSC+$1&filter%5Bexact_match%5D=1

http "https://catalog.fullerton.edu/search_advanced.php?cur_cat_oid=70&search_database=Search&search_db=Search&cpage=1&ecpage=1&ppage=1&spage=1&tpage=1&location=33&filter%5Bkeyword%5D=CPSC+$1&filter%5Bexact_match%5D=1" | grep "Best Match:"