docker stop mjpg-streamer
docker rm mjpg-streamer
docker rmi weesing/mjpg-streamer:latest
docker load < weesing-mjpg-streamer.tar.gz
docker run --name mjpg-streamer -d -p 8081:8081 weesing/mjpg-streamer
