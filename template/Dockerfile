# Be sure to version it!!!
FROM debian:8.0

# initial setup and repos (if needed)
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list  # Now archived
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ jessie main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update

# install
RUN apt-get -y install sigsci-agent

# create app directory
CMD mkdir /app

# add files to the app directory (or wherever you'll be using them)
COPY app /app
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
RUN mkdir /etc/sigsci


#Please use this entry point, and if possible runt he SigSci agent last to make logs easily accessible through Kitematic.
ENTRYPOINT ["/app/start.sh"]
