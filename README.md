
# Balance book 

Balance book is a ledger/book keeping software for small business, 
that aims to provide overview in a firendly environment. 

Frontend uses jquerymobile and xslt transforms. 

Apiary is used to design the backend API at http://docs.balancebook.apiary.io/

Backends are implement the in different frameworks such as: 

 * Java
 * Python
 * nodejs
 

The original (xmlplus) was created from XSLT-views and XML data. 
Some of this legacy remains - but is beeing swapped out for JSON. 
    
     NEW STRUCTURE: 

       Records

          Book (Create, Remove)
            Transactions

          Accounts (Add, remove)
          Balance (Add, remove)
		  Metadata (Set)

          Book-Orders (Create, Remove)
            Transactions (Add, remove, commit)

      
       Dealing with monthly events in template ledger-orders: 

          Incomes
          Intäkt (RR)
          Inbetalning (BR, KF)

          Expenses
          Kostnad (RR)
          Utbetalning (BR, KF)
      
          Bokslut (omföring)
       
