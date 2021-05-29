# Lambda Invoke using docker
Consumer and puslish application go with kafka

### Necessary requirement:
 * Golang
 * Docker
 * docker-compose

Run the command below to run the container along with your application and build it.

```sh
  docker-compose up -d
```
after making the compilation, your lambda is ready to receive invocations.

```curl
  curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"name": "Hello World"}'
```

soon I will make a video available on youtube with more details.

Thanks.