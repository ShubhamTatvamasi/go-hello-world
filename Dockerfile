########### builder ###########
FROM golang AS builder

COPY hello-world.go .

RUN go build hello-world.go

########### hello-world ###########
FROM busybox

COPY --from=builder /go/hello-world .

CMD ["/hello-world"]
