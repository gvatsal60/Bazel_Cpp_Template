
# Targets
.PHONY: all test clean

BUILD_TOOL := bazel
BUILD_CMD := build //$(TOP_DIR):all
TEST_CMD := test //$(TOP_DIR):test
RUN_CMD := run //$(TOP_DIR):main
CLEAN_CMD := clean --async
SONAR_CMD := run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg
