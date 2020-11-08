FROM golang

COPY app.go .
COPY blockchain.html /
RUN go get -d -v \
	github.com/lib/pq \
	github.com/julienschmidt/httprouter

RUN CGO_ENABLED=0 GDOS=linux go build -ldflags='-s -w' -o a.out

ENTRYPOINT ["./a.out"]
EXPOSE 8000
