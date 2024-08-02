FROM golang:latest AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -v -o output/app

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder usr/src/app/output .

CMD [ "./app" ]