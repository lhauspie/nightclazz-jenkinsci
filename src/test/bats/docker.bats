#!/usr/bin/env bats

SUT_IMAGE="demoapp:$(git rev-parse --short HEAD)"
SUT_CONTAINER="demoap-smoke-test"


@test "I can build the Docker image" {
	cd "${BATS_TEST_DIRNAME}/../../.." || false
	docker build -t "${SUT_IMAGE}" ./
}

@test "I can clean any existing test container" {
	docker kill "${SUT_CONTAINER}" &>/dev/null ||:
	docker rm -fv "${SUT_CONTAINER}" &>/dev/null ||:
}

@test "I can start the application with Docker" {
	docker run -d --name "${SUT_CONTAINER}" -P "${SUT_IMAGE}"
}

@test "The application image has java installed and in the PATH" {
	docker exec "${SUT_CONTAINER}" which java
	docker exec "${SUT_CONTAINER}" java -version
}

@test "I can clean any test container" {
	docker kill "${SUT_CONTAINER}" &>/dev/null ||:
	docker rm -fv "${SUT_CONTAINER}" &>/dev/null ||:
}
