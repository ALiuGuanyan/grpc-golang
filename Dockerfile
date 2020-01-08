FROM golang:alpine
WORKDIR /grpc
RUN apk --no-cache add git protobuf protobuf-dev grpc grpc-dev
RUN git clone https://github.com/grpc/grpc-go.git $GOPATH/src/google.golang.org/grpc \
&& git clone https://github.com/golang/net.git $GOPATH/src/golang.org/x/net \
&& git clone https://github.com/golang/sys.git $GOPATH/src/golang.org/x/sys \
&& git clone https://github.com/golang/tools.git $GOPATH/src/golang.org/x/tools \
&& git clone https://github.com/golang/text.git $GOPATH/src/golang.org/x/text \
&& go get -u github.com/golang/protobuf/protoc-gen-go \
&&  git clone https://github.com/google/go-genproto.git $GOPATH/src/google.golang.org/genproto \
&& cd $GOPATH/src/ \
&& go install google.golang.org/grpc \
&& export PATH=$PATH:$GOPATH/bin

EXPOSE 50051
