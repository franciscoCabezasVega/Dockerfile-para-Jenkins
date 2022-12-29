FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install -y libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb && \
    rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

VOLUME /var/jenkins_home

RUN chown -R jenkins:jenkins /var/jenkins_home

USER jenkins
