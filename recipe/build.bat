set "CARGO_PROFILE_RELEASE_STRIP=symbols"
set "CARGO_PROFILE_RELEASE_LTO=true"
set "CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1"

:: build
cargo install --locked --features=all --root "%PREFIX%" --path . --no-track || goto :error

:: generate licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
