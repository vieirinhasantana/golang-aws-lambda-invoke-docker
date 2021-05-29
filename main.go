package main

import (
	"context"
	"errors"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type Event struct {
	Name string `json:"name"`
}

func main() {
	lambda.Start(Handler)
}

func Handler(ctx context.Context, event Event) (string, error) {
	if event.Name == "" {
		return "", errors.New("missing paramenter name")
	}
	result := fmt.Sprintf("Name receive is: %s", event.Name)

	return result, nil
}
