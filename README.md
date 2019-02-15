# Websocket chat client

Frontend for basic chat website that communicates via a websocket backend.

### Prerequisites

Java JDK 7 or higher
Tomcat 8 or higher
Access to a Websocket server that accepts and broadcasts messages in JSON format (local or remote)

### Setup

In order to use this project, you will have to have access to a websocket server.
1. Setup websocket server either on your local machine or remotely.
2. Change the ws variable in webapp/resources/js/websocket.js so that is points to your websocket server.
```
var ws = new WebSocket("ws://websocketserver-env.ecyh3rdrdc.us-west-2.elasticbeanstalk.com:8080/chat/" + room + "/" + sender);
```
>Note: change the "ws://websocketserver-env.ecyh3rdrdc.us-west-2.elasticbeanstalk.com:8080/chat/" string.

## Deployment

1. Complete setup instruction above.
2. Generate .war file
```
mvn clean install
```
3. Deploy to Tomcat server (or equivalent).
4. Check that you can access the data by navigating to ../ in your web browser.

## Built With

* [Spring MVC](https://spring.io/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management

## Authors

* **Granville Broomes** - *Creator* - [Broomes](https://github.com/Broomes)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details