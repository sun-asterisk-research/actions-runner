FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt update -y \
  && sudo apt install build-essential git curl pkg-config libssl-dev -y \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

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
