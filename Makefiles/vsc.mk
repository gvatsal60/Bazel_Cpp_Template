include cfg/.env

# Targets
.PHONY: all test clean

all:
	@bazel build //$(TOP_DIR):all

build:
	@bazel build //$(TOP_DIR):all

test:
	@bazel test //$(TOP_DIR):test

run:
	@bazel run //$(TOP_DIR):main

clean_json:
	@rm -rf compile_commands.json

clean: clean_json
	@bazel clean --async

sonar: clean build
	@bazel run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg
