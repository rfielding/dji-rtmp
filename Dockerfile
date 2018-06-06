FROM  ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y wget
RUN apt-get install -y ffmpeg
RUN mkdir /working
WORKDIR /working
RUN wget http://nginx.org/download/nginx-1.13.1.tar.gz
RUN wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
RUN apt-get install -y build-essential libpcre3 libpcre3-dev libssl-dev unzip zlib1g zlib1g-dev sudo net-tools
RUN unzip master.zip
RUN tar -zxvf nginx-1.13.1.tar.gz
WORKDIR /working/nginx-1.13.1
RUN pwd
RUN ls -al
RUN ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-master
RUN make
RUN make install
COPY rtmpchunk.txt rtmpchunk.txt
COPY entrypoint /entrypoint
RUN cat rtmpchunk.txt >> /usr/local/nginx/conf/nginx.conf
EXPOSE 1935
CMD /entrypoint
