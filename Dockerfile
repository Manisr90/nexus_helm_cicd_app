FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM tomcat:8
WORKDIR /app
RUN sed -i 's/port="8080"/port="9090"/' /usr/local/tomcat/conf/server.xml
COPY --from=build /app/target/devops-integration.jar /app/ 
EXPOSE 8080
CMD ["java","jar","devops-integration.jar"]

