# Check if running inside a Docker container
ifeq ($(shell test -f /.dockerenv && echo -n yes),yes)
    include Makefiles/vsc.mk
else
    include Makefiles/out.mk
endif
