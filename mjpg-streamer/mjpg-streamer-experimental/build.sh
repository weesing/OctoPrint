docker build -t weesing/mjpg-streamer .
docker save weesing/mjpg-streamer:latest | gzip > weesing-mjpg-streamer.tar.gz