#!/usr/bin/env bash

# build statically linked binary with Rust
cargo install --locked --features=all --root "$PREFIX" --path .

# strip debug symbols
"$STRIP" "$PREFIX/bin/sccache"

# remove extra build file
rm -f "${PREFIX}/.crates.toml"

# generate licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
