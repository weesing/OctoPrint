pushd mjpg-streamer/mjpg-streamer-experimental

sudo cp mjpg_streamer.service /etc/systemd/system/mjpg_streamer.service
sudo systemctl stop mjpg_streamer
sudo systemctl start mjpg_streamer
sudo systemctl enable mjpg_streamer
sudo systemctl daemon-reload

popd
