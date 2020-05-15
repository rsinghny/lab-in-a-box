# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# initial SigSci setup
RUN apt-get update
RUN apt-get install -y apt-transport-https wget sed apt-utils
RUN wget -qO - https://apt.signalsciences.net/gpg.key | apt-key add -
RUN echo "deb https://apt.signalsciences.net/release/debian/ stretch main" > /etc/apt/sources.list.d/sigsci-release.list
RUN apt-get update

RUN /bin/true \
    && go get github.com/signalsciences/tlstext \
    && go get gopkg.in/fatih/pool.v2 \
    && go get github.com/tinylib/msgp/... \
    && go get github.com/alecthomas/gometalinter \
    && gometalinter --install 

# copy startup script
COPY start.sh /app/
RUN chmod +x /app/start.sh

# copy main.go
RUN mkdir /go/src/go-hello-world
COPY app/main.go /go/src/go-hello-world

# import and extract SigSci Golang module
RUN mkdir -p /go/src/github.com/signalsciences/
RUN cd /go/src/github.com/signalsciences/
RUN wget https://dl.signalsciences.net/sigsci-module-golang/sigsci-module-golang_latest.tar.gz
RUN mv sigsci-module-golang_latest.tar.gz /go/src/github.com/signalsciences/.
RUN tar -xvzf /go/src/github.com/signalsciences/sigsci-module-golang_latest.tar.gz
RUN mv /go/sigsci-module-golang/ /go/src/github.com/signalsciences

# install SigSci agent
RUN apt-get -y install sigsci-agent

# create the user
RUN useradd -r -s /bin/false helloworld

# Go build
RUN go install go-hello-world
RUN mkdir /etc/sigsci
# start SigSci agent and Golang app
CMD ["/app/start.sh"]
