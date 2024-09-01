FROM golang:1.23.0-bookworm


#assign work directory
WORKDIR /app

COPY Program/go.mod ./

RUN go mod download

COPY Program/ ./

RUN go build -o sv.exe sv.go

EXPOSE 2020

CMD ["./sv.exe"]