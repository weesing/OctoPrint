docker build -t weesing/mjpg-streamer .

echo "Exporting image to build/weesing-mjpg-streamer.tar.gz..."
docker save weesing/mjpg-streamer:latest | gzip > build/weesing-mjpg-streamer.tar.gz
echo "DONE"

echo "Copying over to Raspberry Pi..."
scp build/weesing-mjpg-streamer.tar.gz raspi:~/octoprint/mjpg-streamer/mjpg-streamer-experimental/build/
echo "DONE"

echo "You can now SSH to your Raspberry Pi and run the exec.sh script."