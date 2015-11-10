FROM jenkins

USER root

RUN echo "\n\
Acquire::HTTP::Proxy \"http://192.168.1.10:3128\";\n\
Acquire::HTTPS::Proxy \"http://192.168.1.10:3128\";\n\
" > /etc/apt/apt.conf.d/01proxy && \
  echo "\n\
deb http://kambing.ui.ac.id/debian/ jessie main\n\
deb http://kambing.ui.ac.id/debian/ jessie-updates main\n\
deb http://kambing.ui.ac.id/debian-security/ jessie/updates main\n\
deb http://kambing.ui.ac.id/debian/ jessie-backports main\n\
" > /etc/apt/sources.list && \
  rm -f /etc/apt/sources.list.d/* && \
  apt-get -y update && \
  apt-get install -y php5-cli php5-xdebug
    
USER jenkins 

