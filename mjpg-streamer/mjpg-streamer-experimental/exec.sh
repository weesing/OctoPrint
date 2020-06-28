docker stop mjpg-streamer
docker rm mjpg-streamer
docker build -t weesing/mjpg-streamer .
docker run --name mjpg-streamer -d -p 8081:8081 weesing/mjpg-streamer
