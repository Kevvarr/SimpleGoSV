FROM golang:1.23.0-bookworm


#assign work directory
WORKDIR /app

COPY Program/go.mod ./

RUN go mod download

COPY Program/ ./

RUN go build -o sv.go

EXPOSE 8080

CMD ["./sv"]