FROM python:3-alpine

LABEL name="httpbin"
LABEL version="0.9.2"

COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY requirements.txt /requirements.txt

# Install httpbin
RUN pip install -r /requirements.txt

# Install Signal Sciences
RUN wget https://dl.signalsciences.net/sigsci-agent/sigsci-agent_latest.tar.gz && tar -xvf sigsci-agent_latest.tar.gz
RUN mkdir /etc/sigsci

# Override this PORT env for httpbin
ENV PORT=80
ENTRYPOINT ["/start.sh"]