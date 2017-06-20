# Test rstudio server on Debian Stretch
FROM debian:9

RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y r-base wget gdebi-core && \
  wget --quiet https://s3.amazonaws.com/rstudio-ide-build/server/xenial/amd64/rstudio-server-1.1.276-amd64.deb && \
  gdebi --non-interactive rstudio-server-1.1.276-amd64.deb && \
  rm -f rstudio-server-1.1.276-amd64.deb

# Test run
RUN \
  rstudio-server start && \
  rstudio-server stop

# Starts foreground server
CMD /usr/lib/rstudio-server/bin/rserver 
