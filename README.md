## SQL-Queries

### 1. Create table (CREATE)
* Formulate an SQL query to create the book table book:

		Field		Type, description

		book_id		INT PRIMARY KEY AUTO_INCREMENT
		title		VARCHAR(50)
		author		VARCHAR(30)
		price		DECIMAL(8, 2)
		amount		INT
* Create an ordering table to include the authors and titles of those books whose number of copies in the book table is less than the average number of book copies in the book table. Include the amount column in the table, in which for all books specify the same value - the average number of copies of books in the book table.

### 2. Insert records to a table (INSERT)
* Add four records to the supply table
* Add from the supply table to the book table, all books,except for books written by Bulgakov M.A. and Dostoevsky F.M.
* Enter from the supply table into the book table only   those books whose authors are not in book.

### 3. Update Requests (UPDATE)
* Decrease by 10% the price of those books in the book table whose number belongs to the interval from 5 to 10, including the borders.
* In the book table, you need to adjust the value for the buyer in the buy column so that it does not exceed the number of book copies specified in the amount column. And the price of those books that the buyer did not order, reduce by 10%.
* For those books in the book table that are in the supply table, not only increase their number in the book table (increase their number by the value of the amount column in the supply table), but also recalculate their price (for each book, find the sum of prices from the book and supply tables and divide by 2).

### 4. Requests for deletion (DELETE)
* Remove from the supply table the books of those authors whose total number of book copies in the book table exceeds 10.
* Remove from the fine table information about violations committed before February 1, 2020.
* Delete all authors and all their books whose total number of books is less than 20.
* Delete all genres that include less than 4 books. In the book table for these genres, set the value to Null.