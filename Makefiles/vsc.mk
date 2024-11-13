# Targets
.PHONY: all
all:
	@bazel build //project:all

.PHONY: build
build:
	@bazel build //project:all

.PHONY: test
test:
	@bazel test //project:test

.PHONY: run
run:
	@bazel run //project:main

.PHONY: clean_json
clean_json:
	@rm -rf compile_commands.json

.PHONY: clean
clean: clean_json
	@bazel clean --async

.PHONY: sonar
sonar: clean_json
	@bazel run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg
