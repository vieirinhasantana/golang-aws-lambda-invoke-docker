FROM alpine as build
# install build tools
RUN apk add go git
RUN go env -w GOPROXY=direct
# cache dependencies
ADD go.mod go.sum ./
RUN go mod download 
# build
ADD . .
RUN go build -o /main
# copy artifacts to a clean image
FROM alpine
COPY --from=build /main /main

RUN mkdir -p /.aws-lambda-rie
ADD https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie /.aws-lambda-rie/aws-lambda-rie
RUN chmod +x /.aws-lambda-rie/aws-lambda-rie

ENTRYPOINT [ "/.aws-lambda-rie/aws-lambda-rie" ] 
CMD [ "/main" ]