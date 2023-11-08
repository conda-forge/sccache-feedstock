#!/usr/bin/env bash

set -euxo pipefail

# build statically linked binary with Rust
cargo install --features=all --root "$PREFIX" --path .

# strip debug symbols
"$STRIP" "$PREFIX/bin/sccache"

# remove extra build file
rm -f "${PREFIX}/.crates.toml"
