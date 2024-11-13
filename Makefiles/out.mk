include Makefiles/docker.mk

BUILD_CMD := bazel build //$(TOP_DIR):all
TEST_CMD := bazel test //$(TOP_DIR):test
RUN_CMD := bazel run //$(TOP_DIR):prog
CLEAN_CMD := bazel clean
SONAR_CMD := bazel run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg

# Define the path to the Dockerfile
DOCKER_FILE_PATH := dockerfiles/Dockerfile

# Define the default target
.PHONY: all test clean

# Targets
all: build run

# Target: build_img
# Description: Builds the Docker image using the specified Dockerfile
.PHONY: build_img
build_img:
	@$(DOCKER_HOST) image build -t $(DOCKER_IMG_NAME) -f $(DOCKER_FILE_PATH) $(DOCKER_BUILD_CONTEXT)

# Code Build
build: build_img
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) "$(BUILD_CMD)"

# Test code
test: build_img
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) "$(TEST_CMD)"

# Run code
run: build_img
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) "$(RUN_CMD)"

# Clean
clean: build_img
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) "$(CLEAN_CMD)"

# Sonar
sonar: clean build
	@$(DOCKER_HOST) container run $(DOCKER_ARG) $(DOCKER_IMG_NAME) "$(SONAR_CMD)"
