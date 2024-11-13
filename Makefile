# Targets
.PHONY: all
all:
.PHONY: test
test:
.PHONY: clean
clean:

sonar:
	bazel run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg
