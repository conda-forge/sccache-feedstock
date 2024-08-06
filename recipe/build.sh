#!/usr/bin/env bash

export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=true
export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

# build statically linked binary with Rust
cargo install --locked --features=all --root "$PREFIX" --path .

# remove extra build file
rm -f "${PREFIX}/.crates.toml"

# generate licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
