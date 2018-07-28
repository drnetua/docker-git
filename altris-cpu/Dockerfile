FROM microsoft/cntk:2.5.1-cpu-python3.5

#update & git
RUN apt-get update && apt-get install -y git
RUN /root/anaconda3/bin/pip install --upgrade pip

#Altris specific
RUN /root/anaconda3/bin/pip install flask flask_restful cntk opencv-python

RUN apt-get install -y build-essential cmake pkg-config \
    libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
    libxvidcore-dev libx264-dev libsm6 libxext6

RUN apt-get install -y libxrender-dev

RUN mkdir /root/.ssh/ && \
	mkdir /repository && \
	mkdir /app && \
	touch /root/.ssh/known_hosts && \
	ssh-keyscan -H github.com >> /root/.ssh/known_hosts && \
	ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts && \
	echo "\nStrictHostKeyChecking no" >> /etc/ssh/ssh_config

EXPOSE 5000

ADD ./init.sh /app
RUN chmod 775 /app/init.sh

# Clean up
RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/app/init.sh"]
