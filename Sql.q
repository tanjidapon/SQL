USE bank ;
CREATE TABLE customer ( customer_name varchar(100), customer_city varchar (100) );
CREATE TABLE loan ( loan_number int (100), branch_name varchar (100) , amount int );
CREATE TABLE borrower ( customer_name varchar(100), loan_number int (100) );
CREATE TABLE depositor ( customer_name varchar(100), account_number int (100) );
You’ve got an interesting database management assignment! Let’s tackle these SQL queries one by one.

### **SET A**
1. **Find all loan numbers for loans made at the 'Dakkhin Khan' branch with loan amounts greater than BDT 1200:**
   ```sql
   SELECT loan_number
   FROM loan
   WHERE branch_name = 'Dakkhin Khan' AND amount > 1200;
   ```

2. **List the entire loan relation in descending order of amount. If several loans have the same amount, order them in ascending order by loan number:**
   ```sql
   SELECT * 
   FROM loan
   ORDER BY amount DESC, loan_number ASC;
   ```

3. **Add a new column to the customer relation named 'Contact_no.' If there is no contact information, show '-not provided':**
   ```sql
   ALTER TABLE customer
   ADD COLUMN Contact_no VARCHAR(15) DEFAULT '-not provided';
   ```

### **SET B**
1. **Find the loan number of those loans with loan amounts between BDT 80,000 and BDT 10,000:**
   ```sql
   SELECT loan_number
   FROM loan
   WHERE amount BETWEEN 10000 AND 80000;
   ```

2. **Find the names of all customers whose address includes the substring 'gram':**
   ```sql
   SELECT customer_name
   FROM customer
   WHERE customer_city LIKE '%gram%';
   ```

3. **Add a new column to the depositor relation named 'd_amount.' And don't allow less than BDT 1000:**
   ```sql
   ALTER TABLE depositor
   ADD COLUMN d_amount INT CHECK (d_amount >= 1000);
   ```

### **SET C**
1. **For all customers who have a loan from the bank, find their names and loan numbers:**
   ```sql
   SELECT borrower.customer_name, borrower.loan_number
   FROM borrower
   JOIN loan ON borrower.loan_number = loan.loan_number;
   ```

2. **Add a new column to the customer relation named 'balance.' And don't allow less than BDT 500:**
   ```sql
   ALTER TABLE customer
   ADD COLUMN balance INT CHECK (balance >= 500);
   ```

3. **Delete all loans with loan amounts between BDT 1100 and BDT 1400:**
   ```sql
   DELETE FROM loan
   WHERE amount BETWEEN 1100 AND 1400;
  
