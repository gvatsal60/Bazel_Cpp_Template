# Targets
.PHONY: all
all:
	@bazel build //project:all

.PHONY: test
test:
	@echo "Not Yet Included!!!"

.PHONY: run
run:
	@bazel run //project:main

.PHONY: clean
clean:
	@bazel clean --async

sonar:
	@bazel run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg
