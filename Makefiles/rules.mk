
# Targets
.PHONY: all test clean

BUILD_TOOL := bazel
BUILD_CMD := $(BUILD_TOOL) build //$(TOP_DIR):all
TEST_CMD := $(BUILD_TOOL) test //$(TOP_DIR):test
RUN_CMD := $(BUILD_TOOL) run //$(TOP_DIR):main
CLEAN_CMD := $(BUILD_TOOL) clean --async
SONAR_CMD := $(BUILD_TOOL) run @hedron_compile_commands//:refresh_all -- --compilation_mode=dbg
