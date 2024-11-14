include cfg/.env
include Makefiles/rules.mk

# Targets
.PHONY: all test clean

all: clean build

build:
	@$(BUILD_TOOL) $(BUILD_CMD)

test:
	@$(BUILD_TOOL) $(TEST_CMD)

run:
	@$(BUILD_TOOL) $(RUN_CMD)

clean:
	@$(BUILD_TOOL) $(CLEAN_CMD)

sonar: clean build
	@$(BUILD_TOOL) $(SONAR_CMD)
