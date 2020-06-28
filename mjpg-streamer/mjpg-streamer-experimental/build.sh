docker build -t weesing/mjpg-streamer .
docker save weesing/mjpg-streamer:latest | gzip > build/weesing-mjpg-streamer.tar.gz