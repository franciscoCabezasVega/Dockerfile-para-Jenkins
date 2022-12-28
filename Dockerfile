FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y sudo && \
    rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

VOLUME /var/jenkins_home

RUN chown -R jenkins:jenkins /var/jenkins_home

USER jenkins