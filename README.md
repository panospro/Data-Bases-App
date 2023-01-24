# Data Bases App

## In the 'shelter' folder there is:
* A folder containing all the files necessary to set up the website. This folder contains the following files:
  * A Website.html file, which contains all the code written in html and javascript, i.e. the skeleton and the process that the buttons clicked on the website do
  * A style.css file, which contains the appearance of the website
  * 14 animal .png photos, used on the website
  * Five .php files, which help the website to send the information that someone fills out on a form to our database
  * A shelterdb.sql file, which contains the code of our entire database and will help us below to connect our database to the equal (local web).
* The present README.md file (which you can open in any way you like)

The first thing you need to do before you start browsing the site is to make the database work on the internet on localhost, not as a file, so that you can send data to our database. For this you need to download the XAMPP server and follow some steps explained below and join the .php files to the base in phpmyadmin by the way.

## How to connect HTML a database to MySQL using PHP, so that the answers that each user fills in the forms on the website are stored? 

The way we used is with the XAMPP server and then using the PHP language.  

XAMPP is a popular cross-platform web server that allows developers to write and test their code on a local web server.

First we need to install XAMPP from the following website. https://www.apachefriends.org/download.html . 
With this software, we will get a local web server, e.g. Apache, PHP language and MySQL database. 

After installation to connect our database from MySQL to XAMPP, follow the next steps:

* Open the XAMPP Control Panel
* Click on the Apache-Start button
* Click on the MySQL-Start button

Then you need to check that your local computer is working or not. Open your browser and check this URL http://127.0.0.1 or http://localhost/ . If it works, it means you have enabled your local web server with PHP/MySQL.

Also, the PHPmyAdmin GUI comes for handling CRUD operations, e.g. inserting (creating), updating, deleting and selecting (reading) records from tables. This browser based interface is very useful, easy to use for creating and managing phpmyadmin database in table (column, row).

If you have the above setup, you can start coding.

Open a web browser (chrome, firefox, edge, etc, ) and type this http://localhost/phpmyadmin/ or http://127.0.0.1/phpmyadmin/ for open GUI for DB management on your computer. Then:

* Create a new database named shelterdb, in the field that says Create Database
* Then from the databases listed on the left, select the shelterdb database
* Then click on the SQL Code it says in the fields above
* Copy paste the code that is in the shelterdb.sql file that you give in the shelter folder
 
Once you have done this we are ready to get started. Go to http://localhost/shelter/Website.html and you will be ready to fully use the website.  

The results you enter in the form will now be populated in the corresponding table in our database in phpmyadmin. To see the results for the form:

* LOST PET FORM, browse to the lost table
* FOUND PET FORM, browse to the found table.
* DONATION FORM, browse to the donation table
* VOLUNTEER APPLICATION FORM, enter the table nvolunteers
* ADOPTION FORM, go to the nadopt table


To export data from phpmyadmin click on our database and export. This will create a .sql file with all the data last added to the form.

For the website new tables were created different to those in the 2nd deliverable, which are essentially some temporary tables that anyone can enter anything they want (we would like to think that what they enter is reliable, some restrictions were put in place to check the accuracy of the data being delivered, but it was still chosen to be done this way to be sure), but then it will be checked by someone, within the animal welfare team to see the validity of the data entered.  
