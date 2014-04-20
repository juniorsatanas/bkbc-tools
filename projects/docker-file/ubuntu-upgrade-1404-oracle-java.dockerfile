# ubuntu-14.04
# ref https://index.docker.io/u/angelrr7702/docker-ubuntu-14.04/
FROM angelrr7702/docker-ubuntu-14.04
MAINTAINER Y12STUDIO
RUN locale-gen en_US.UTF-8
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN apt-get install -y git
