## The Games DB

### Pre-requisites

* [Docker for OSX or Docker for Windows](https://www.docker.com/products/docker) or [Play with Docker](https://labs.play-with-docker.com/)
* [IntelliJ Community Edition](https://www.jetbrains.com/idea/download/)
* [Java Development Kit](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)


### Getting Started

To run the application first create a file named .env in the root directory, which will hold the database credentials and URL:

```
DB_URL=jdbc:mysql://thegamesdb-database:3306/thegamesdb
DB_USER=root
DB_PASS=password
```

Then run the following commands starting from the root directory of the project:

```
cd thegamesdb-webserver/app
mvn clean
mvn install
cd ../..
docker-compose up
```

You can then visit http://localhost:8080/TheGamesDb to see the app in action.

### Play with Docker

If running from Play with Docker, create the .env file in the same way and use the existing target file to simply run docker-compose straight away.