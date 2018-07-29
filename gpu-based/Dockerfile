FROM microsoft/cntk:2.5.1-gpu-python3.5-cuda9.0-cudnn7.0

#update & git
RUN mkdir /app && apt-get update && apt-get install -y git

RUN mkdir /root/.ssh/ && \
        mkdir /repository && \
        touch /root/.ssh/known_hosts && \
        ssh-keyscan -H github.com >> /root/.ssh/known_hosts && \
        ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts && \
        echo "\nStrictHostKeyChecking no" >> /etc/ssh/ssh_config

#flask/cv2/python specific dependencies
ADD ./pre-install.sh /app
RUN chmod +x /app/pre-install.sh && /app/pre-install.sh && rm /app/pre-install.sh

EXPOSE 5000

ADD ./init.sh /app
