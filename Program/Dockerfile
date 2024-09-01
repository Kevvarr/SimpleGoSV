from golang:1.23.0-bookworm


#assign work directory
WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o sv.go

EXPOSE 8080