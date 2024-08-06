set "CARGO_PROFILE_RELEASE_STRIP=symbols"
set "CARGO_PROFILE_RELEASE_LTO=true"
set "CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1"

:: build
cargo install --locked --features=all --root "%PREFIX%" --path . || goto :error

:: remove extra build file
del /F /Q "%PREFIX%\.crates.toml"
del /F /Q "%PREFIX%\.crates2.json"

:: generate licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
