FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt update -y && sudo apt install build-essential git curl -y

ENV HELPER_SCRIPTS=/scripts/helpers
ENV HOME=/home/runner

COPY --chown=runner:docker scripts /scripts

RUN chmod +x /scripts/*.sh

RUN curl -fsSL https://sh.rustup.rs | sh -s -- -y --default-toolchain=stable --profile=minimal

ENV PATH="${HOME}/.cargo/bin:${PATH}"

# Install common tools
RUN rustup component add rustfmt clippy

# Cleanup Cargo cache
RUN rm -rf ${HOME}/registry/*

RUN sudo /scripts/cleanup.sh
