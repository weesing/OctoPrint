echo "Removing current containers and images..."
docker stop mjpg-streamer
docker rm mjpg-streamer
docker rmi weesing/mjpg-streamer:latest
echo "DONE"

echo "Building image..."
docker build -t weesing/mjpg-streamer .
echo "DONE"

# echo "Loading image build/weesing-mjpg-streamer.tar.gz..."
# docker load < build/weesing-mjpg-streamer.tar.gz
# echo "DONE"

echo "Starting container..."
docker run --name mjpg-streamer  -d -t -i -p 8081:8081/tcp --device=/dev/video0 image:tag
echo "DONE"

docker logs -f mjpg-streamer
