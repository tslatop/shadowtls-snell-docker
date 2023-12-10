#!/bin/bash

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "Usage: build.sh VERSION"
    exit 1
fi

docker build \
  --push \
  --platform linux/arm64 \
  --build-arg VERSION=${VERSION} \
  --tag tslatop/snell-server:$VERSION \
  .
