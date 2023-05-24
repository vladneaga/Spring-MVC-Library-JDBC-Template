# Spring-MVC-Library-JDBC-Template

The application is built using the Spring MVC framework, which provides a robust and flexible structure for building web applications. The JDBC Template is used to interact with the database, allowing for efficient and secure data access as well as low level interaction with database.

The main features of the library application include:

User Management: The application allows the creation, deletion, and editing of user information as well as adding or removing books. Each user can own zero or more books.

Book Management: The application allows for the creation, deletion, and editing of books in the library system. Each book can be assigned to one person.

During the developemt I encountered problems regarding foreign key connection between book.person_id and person.id columns, as when a person was removed, the null value of book.person_id caused problems with displaying the correspondend view(html file), so I decided to create a reference value in the person table, with the id=1, in order to avoid null values. This value cannot be accesed by the users, and will be prescribed to books released from a person or whose owner was deleted.

The used database is MySql. To run the application, you will need to have Java, MySQL and an application server installed on your computer.

I used Tomcat Server 9.0. Be sure that you do not use any version above 10.0, because the application is based on Spring 5. The 6th version of Spring Framework can be run on Tomcat Server 10.0 or newer.

To get started with the application, simply clone the repository from GitHub, adjust the application.properties files to your prefered settings and add the mysql file placed in the branch to your database management program.
