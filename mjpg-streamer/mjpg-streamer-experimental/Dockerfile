FROM ubuntu

RUN apt update && apt install git subversion libjpeg62-turbo-dev imagemagick ffmpeg libv4l-dev cmake

LABEL Description="A Docker image for mjpg_streamer." Version="0.3"

# Build mjpg_streamer
# Need to run container with the device: docker run -t -i -p 8081:8081/tcp --device=/dev/video0 image:tag
RUN git clone https://github.com/jacksonliam/mjpg-streamer.git 

WORKDIR /mjpg-streamer/mjpg-streamer-experimental

RUN make \ 
    && make install \
    && chmod +x docker-start.sh

EXPOSE 8081/TCP

ENTRYPOINT ["/mjpg-streamer/mjpg-streamer-experimental/docker-start.sh", "output_http.so -w ./www"]

CMD ["input_uvc.so"]
