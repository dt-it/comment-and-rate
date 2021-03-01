# comment-and-rate
Web page for users to add, like, rate and comment posts.
Application written during javastart Web Technologies course - extended with many additional functionalities and still being developed.
#### Project built using following languages and tools:
- Java 15
- HTML 5
- CSS 3
- Tomcat 10
- Maven for automatic building
- MySQL as database implementation

# Application Structure
### Configuration
Database connection package. The connection pool is provided in file ```webapp/META-INF/context.xml```.
### Domain
Classes with the main logic of the application and object mapping (services), data model classes and classes related to database operations(Dao). Each table in the database has a connection with one model class.
### Client
The client part of the application, i.e. enabling reference to business logic classes. This package contains all controllers.
### Webapp
Part of the application with the frontend implementation (jsp, jspf, css).

# Quick Start

## INTRODUCTION

#### 1. Create a MySQL database
```CREATE DATABASE commentandrate``` <br>
You may also import to MySQL provided file ```commentandrate.sql``` <br> <br>
In case you want to use a different database name, follow the next steps: <br>
                
```CREATE DATABASE DB_NAME;``` <br>
Open ```src/main/webapp/META-INF/context.xml``` file <br>
Change ```Resource name```, ```url``` and ```dataSourceName``` to match your preferred database name DB_NAME <br>


#### 2. Modify MySQL username and password 

Open ```src/main/webapp/META-INF/context.xml``` file <br>
Change ```username``` and ```password``` to match your MySQL connection <br>

## BUILD & RUN THE PROJECT
To launch the application, edit configurations by adding TomcatServer (or any server you prefer) and change deployment options: add Artifact and  change application context. Next, click the ```Run Tomcat``` button from your IDE;

The server will start running at http://localhost:8080/comment-and-rate or other application context name if you changed the name.

## AFTER RUNNING
You are now ready to explore prepared discoveries. You can also register/login and add your own discoveries, comment and like existing ones.
All existing and new information will be automaticly saved in database.
