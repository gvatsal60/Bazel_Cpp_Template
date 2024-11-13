# ##########################################################################
# File: Dockerfile
# Author: Vatsal Gupta (gvatsal60)
# Date: 08-Nov-2024
# Description: Dockerfile for Bazel DevContainer
# ##########################################################################

# ##########################################################################
# License
# ##########################################################################
# This Dockerfile is licensed under the Apache 2.0 License.

# ##########################################################################
# Base Image
# ##########################################################################
FROM gcr.io/bazel-public/bazel:latest AS base

# ##########################################################################
# Maintainer
# ##########################################################################
LABEL maintainer="Vatsal Gupta (gvatsal60)"

# ##########################################################################
# Install Dependencies
# ##########################################################################
USER root

RUN apt-get update \
  && apt-get -y install --no-install-recommends \
  apt-transport-https \
  apt-utils \
  bash-completion \
  build-essential \
  ca-certificates \
  curl \
  git \
  && apt-get -y clean \
  && rm -rf /var/lib/apt/lists/*

# Add buildifier
ARG BUILDIFIER_BIN_PATH="/usr/local/bin/buildifier"
ARG BUILDIFIER_VER=v7.3.1
ARG BUILDIFIER_LINK=https://github.com/bazelbuild/buildtools/releases/download/${BUILDIFIER_VER}/buildifier-linux-amd64

ADD ${BUILDIFIER_LINK} ${BUILDIFIER_BIN_PATH}
RUN chmod +x ${BUILDIFIER_BIN_PATH}

# ##########################################################################
# USER
# ##########################################################################
USER ubuntu

# ##########################################################################
# Copy Files
# ##########################################################################

# ##########################################################################
# Set Working Directory
# ##########################################################################

# ##########################################################################
# Expose Port
# ##########################################################################

# ##########################################################################
# Command to Run
# ##########################################################################
CMD [ "version" ]