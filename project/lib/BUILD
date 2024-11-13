cc_library(
    name = "hello-time",
    srcs = glob(["src/*.cc"]),  # Automatically include all .cc files in lib/src/
    hdrs = glob(["inc/*.h"]),  # Automatically include all .h files in lib/inc/
    includes = ["inc"],  # Include lib/inc in the include search path
    visibility = ["//project:__pkg__"],  # Make hello-time visible to the main target
)
