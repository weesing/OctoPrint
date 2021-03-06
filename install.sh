sudo apt update
sudo apt install python-pip python-dev python-setuptools python-virtualenv git libyaml-dev build-essential
virtualenv venv
source venv/bin/activate
pip install pip --upgrade
pip install octoprint

sudo usermod -a -G tty pi
sudo usermod -a -G dialout pi

# wget https://github.com/foosel/OctoPrint/raw/master/scripts/octoprint.init && sudo mv octoprint.init /etc/init.d/octoprint
# wget https://github.com/foosel/OctoPrint/raw/master/scripts/octoprint.default && sudo mv octoprint.default /etc/default/octoprint
# sudo chmod +x /etc/init.d/octoprint

# wget https://github.com/OctoPrint/OctoPrint/raw/master/scripts/octoprint.service && 
sudo cp octoprint.service /etc/systemd/system/octoprint.service

sudo cp ./config/octoprint /etc/default/

sudo systemctl enable octoprint
sudo systemctl start octoprint

sudo apt install haproxy
sudo mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
sudo cp config/haproxy.cfg /etc/haproxy/

sudo systemctl enable haproxy
sudo systemctl start haproxy

sudo apt install subversion libjpeg62-turbo-dev imagemagick ffmpeg libv4l-dev cmake
git clone https://github.com/jacksonliam/mjpg-streamer.git
pushd mjpg-streamer && rm -rf .git
popd

pushd mjpg-streamer/mjpg-streamer-experimental
export LD_LIBRARY_PATH=.
make

sudo cp mjpg_streamer.service /etc/systemd/system/mjpg_streamer.service
sudo systemctl stop mjpg_streamer
sudo systemctl start mjpg_streamer
sudo systemctl enable mjpg_streamer
sudo systemctl daemon-reload

popd
