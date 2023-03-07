# SQL-Queries

##1. Create table
	*Formulate an SQL query to create the book table book:

		Field		Type, description

		book_id		INT PRIMARY KEY AUTO_INCREMENT
		title		VARCHAR(50)
		author		VARCHAR(30)
		price		DECIMAL(8, 2)
		amount		INT

##2. Insert records to a table 
	*Add four records to the supply table
	*Add from the supply table to the book table, all books,except for books written by Bulgakov M.A. and Dostoevsky F.M.
	*Enter from the supply table into the book table only   those books whose authors are not in book.
