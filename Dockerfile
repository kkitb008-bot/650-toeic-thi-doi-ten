# Bước 1: Build stage
FROM eclipse-temurin:11-jdk AS build
WORKDIR /app


# Copy MySQL JDBC driver from local lib/ directory
COPY lib/mysql-connector-java-8.0.33.jar lib/mysql-connector.jar

# Copy code và biên dịch
COPY . .
RUN mkdir -p build && javac -d build -cp "lib/mysql-connector.jar" src/server/*.java src/client/*.java

# Bước 2: Run stage
FROM eclipse-temurin:11-jre
WORKDIR /app

COPY --from=build /app/build ./build
COPY --from=build /app/lib ./lib
COPY start.sh .

RUN chmod +x start.sh
EXPOSE 8080

CMD ["./start.sh"]