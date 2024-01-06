docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker network create localnetwork
docker run -e MYSQL_DATABASE=bookmyshow --name localmysql -e MYSQL_ROOT_PASSWORD=admin -d --network localnetwork mysql
sleep 10
cd ..
./mvnw.cmd clean package -DskipTests
docker build -t local/movie2 .
docker run -e MYSQL_HOST=localmysql -e MYSQL_PORT=3306 -e MYSQL_USERNAME=root -e MYSQL_PASSWORD=admin -e MYSQL_DATABASE_NAME=bookmyshow --network localnetwork -p 8080:8080 local/movie2
