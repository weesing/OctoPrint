pushd mjpg-streamer/mjpg-streamer-experimental
export LD_LIBRARY_PATH=.
make

# sudo cp mjpg_streamer /usr/bin
# sudo chmod u+x /usr/bin/mjpg_streamer

sudo cp mjpg_streamer.service /etc/systemd/system/mjpg_streamer.service
sudo systemctl stop mjpg_streamer
sudo systemctl start mjpg_streamer
sudo systemctl enable mjpg_streamer
sudo systemctl daemon-reload
# sudo adduser --system --ingroup video mjpg_streamer

# nohup ./mjpg_streamer -i "./input_raspicam.so -fps 5" -o "./output_http.so"

popd
