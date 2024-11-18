# Bazel C++ Template

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://img.shields.io/github/license/gvatsal60/Bazel_Cpp_Template)
[![build status](https://github.com/gvatsal60/Bazel_Cpp_Template/actions/workflows/readme-checker.yaml/badge.svg)](https://github.com/gvatsal60/Bazel_Cpp_Template/actions/workflows/readme-checker.yaml)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/gvatsal60/Bazel_Cpp_Template/master.svg)](https://results.pre-commit.ci/latest/github/gvatsal60/Bazel_Cpp_Template/HEAD)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=gvatsal60_Bazel_Cpp_Template&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=gvatsal60_Bazel_Cpp_Template)
[![Build Project](https://github.com/gvatsal60/Bazel_Cpp_Template/actions/workflows/build.yml/badge.svg)](https://github.com/gvatsal60/Bazel_Cpp_Template/actions/workflows/build.yml)
![GitHub pull-requests](https://img.shields.io/github/issues-pr/gvatsal60/Bazel_Cpp_Template)
![GitHub Issues](https://img.shields.io/github/issues/gvatsal60/Bazel_Cpp_Template)
![GitHub forks](https://img.shields.io/github/forks/gvatsal60/Bazel_Cpp_Template)
![GitHub stars](https://img.shields.io/github/stars/gvatsal60/Bazel_Cpp_Template)

This is a template repository for C++ projects using [Bazel](https://bazel.build/) as the build system.
This template provides a basic structure for building C++ applications or libraries with Bazel,
and includes common practices such as modular build definitions, unit testing, and the integration of external dependencies.

## Prerequisites

To use this template, you need to have the following installed:

- [Docker](https://www.docker.com/)
- [Make](https://www.gnu.org/software/software.html)

## Getting Started

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/gvatsal60/Bazel_Cpp_Template.git
cd Bazel_Cpp_Template
```

### 2. Build the Project

You can build the C++ project with the following command:

```bash
make build
```

This will build the target defined in the `BUILD` file located in the `project` directory.

### 3. Add More Targets

To add additional C++ files, modify the `BUILD` file in the relevant directory to include them. Here's an example of how a `BUILD` file could look:

```python
cc_binary(
    name = "my_binary",
    srcs = glob(["src/*.cc"]),
    deps = [
        ":my_library",  # Reference to a local library
        "//external:some_dependency",  # External dependencies
    ],
)

cc_library(
    name = "my_library",
    srcs = glob(["src/*.cc"])
    hdrs = glob(["src/*.h"]),
)
```

## Directory Structure

Here’s the basic directory structure for this project:

```tree
/Bazel_Cpp_Template
├── Makefile                    # Makefile for the targets
├── WORKSPACE                   # Workspace definition (required by Bazel)
├── MODULE.bazel
└──project
    ├── BUILD                   # Root BUILD file
    ├── inc                     # Header file
    │   └── hello-greet.h
    ├── lib
    │   ├── BUILD               # BUILD file for lib
    │   ├── inc                 # Header file
    │   │   └── hello-time.h
    │   └── src                 # C++ source files
    │       └── hello-time.cc
    └── src                     # C++ source files
        ├── hello-greet.cc
        └── main.cc
```

### Important Files

- **BUILD**: Defines the build targets (e.g., executables, libraries) for a specific directory.
- **WORKSPACE**: Defines the root of the workspace, and optionally specifies external dependencies.
- **src/**: Contains the source code of the project.
- **inc/**: Contains the include code of the project.

## Running Tests

This template comes with a simple unit test example. To add more tests, create new `.cc` files under a `tests` directory, and define them in a `BUILD` file using the `cc_test` rule.

For example, a simple test could look like:

```python
cc_test(
    name = "my_test",
    srcs = glob(["tests/src/*.cc"]),
    deps = [
        "//src:my_binary",  # Example of linking to the binary
        "@gtest//:gtest",   # Google Test dependency (external)
    ],
)
```

To run tests with Bazel, use:

```bash
bazel test //tests:my_test
```

## Adding External Dependencies

Bazel supports fetching external dependencies from remote repositories or GitHub. You can add dependencies to the `WORKSPACE` file using `http_archive`, `git_repository`, or other rules.

Example of adding a dependency:

```python
http_archive(
    name = "gtest",
    urls = ["https://github.com/google/googletest/archive/refs/tags/release-1.10.0.tar.gz"],
    strip_prefix = "googletest-release-1.10.0",
)
```

After adding dependencies, you can reference them in your `BUILD` files.

## Common Bazel Commands

Here are some common Bazel commands you can use:

- **Build**: `bazel build //src:my_binary`
- **Run**: `bazel run //src:my_binary`
- **Test**: `bazel test //tests:my_test`
- **Clean**: `bazel clean`
- **Fetch**: `bazel fetch //src:my_binary` (fetch all dependencies)

## Further Reading

- [Bazel Documentation](https://docs.bazel.build)
- [Bazel C++ Rules](https://docs.bazel.build/versions/main/be/c-cpp.html)
- [Google Test Integration with Bazel](https://docs.bazel.build/versions/main/tutorial/test.html)

You can adapt this template to your specific needs, whether it’s a small utility or a large C++ library, and include more advanced configurations as necessary.
Let me know if you need further modifications!

## Contributing

Contributions are welcome! Please read our
[Contribution Guidelines](https://github.com/gvatsal60/Bazel_Cpp_Template/blob/HEAD/CONTRIBUTING.md)
before submitting pull requests.

## License

This project is licensed under the Apache License 2.0 License - see the
[LICENSE](https://github.com/gvatsal60/Bazel_Cpp_Template/blob/HEAD/LICENSE) file for details.
