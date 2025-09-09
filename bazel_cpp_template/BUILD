cc_library(
    name = "newlib",
    hdrs = glob([
        "lib/inc/*.h",
        "inc/*.h",
    ]),
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "main",
    srcs = glob(["src/*.cc"]),  # Automatically include all .cc files in src/
    includes = [
        "inc",  # Add inc directory to search paths for header files
        "lib/inc",  # Add lib/inc directory for hello-time headers
    ],
    deps = [
        ":newlib",
        "//bazel_cpp_template/lib:hello-time",  # Use the correct target name: //bazel_cpp_template/lib:hello-time
    ],
)
