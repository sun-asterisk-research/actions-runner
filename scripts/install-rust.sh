#!/bin/bash -e
################################################################################
##  File:  install-rust.sh
##  Desc:  Install Rust
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/etc-environment.sh

export RUSTUP_HOME=/etc/skel/.rustup
export CARGO_HOME=/etc/skel/.cargo

curl -fsSL https://sh.rustup.rs | sh -s -- -y --default-toolchain=stable --profile=minimal

# Initialize environment variables
source $CARGO_HOME/env

# Install common tools
rustup component add rustfmt clippy

# Cleanup Cargo cache
rm -rf ${CARGO_HOME}/registry/*

# Update /etc/environemnt
prepend_etc_environment_path '$HOME/.cargo/bin'
