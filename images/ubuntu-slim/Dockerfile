ARG RUNNER_VERSION=2.331.0
FROM ghcr.io/actions/actions-runner:${RUNNER_VERSION} AS base

ARG IMAGE_VERSION=1.0.0
ARG IMAGE_OWNER="GitHub"

ENV IMAGE_OWNER=$IMAGE_OWNER
ENV ImageVersion=$IMAGE_VERSION
ENV IMAGE_VERSION=$IMAGE_VERSION
ENV ImageOS="Linux"
ENV IMAGE_TARGET_PLATFORM="GitHub"
ENV POWERSHELL_DISTRIBUTION_CHANNEL="GitHub-Actions-$ImageOS"
ENV IMAGEDATA_NAME="ubuntu:24.04"
ENV NVM_DIR="/etc/skel/.nvm"
ENV HELPER_SCRIPTS="/tmp/scripts/helpers"
ENV INSTALLER_SCRIPT_FOLDER="/tmp/toolsets"

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

COPY scripts/build /tmp/scripts/build
COPY scripts/helpers /tmp/scripts/helpers
COPY toolsets/ /tmp/toolsets/
RUN sudo find /tmp/scripts -name "*.sh" -type f -exec chmod +x {} \;

COPY scripts/entrypoint.sh /opt/entrypoint.sh
RUN sudo chmod +x /opt/entrypoint.sh

RUN echo 'set -eo pipefail' | sudo tee -a /etc/bash.bashrc

RUN sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -y sudo lsb-release jq dpkg && \
    sudo touch /run/.containerenv && \
    sudo -E /tmp/scripts/build/configure-apt-sources.sh && \
    sudo -E /tmp/scripts/build/configure-apt.sh && \
    sudo -E /tmp/scripts/build/install-apt-vital.sh && \
    sudo -E /tmp/scripts/build/install-ms-repos.sh && \
    sudo -E /tmp/scripts/build/configure-image-data-file.sh && \
    sudo -E /tmp/scripts/build/configure-environment.sh && \
    sudo -E /tmp/scripts/build/install-actions-cache.sh && \
    sudo -E /tmp/scripts/build/install-apt-common.sh && \
    sudo -E /tmp/scripts/build/install-azcopy.sh && \
    sudo -E /tmp/scripts/build/install-azure-cli.sh && \
    sudo -E /tmp/scripts/build/install-azure-devops-cli.sh && \
    sudo -E /tmp/scripts/build/install-bicep.sh && \
    sudo -E /tmp/scripts/build/install-aws-tools.sh && \
    sudo -E /tmp/scripts/build/install-git.sh && \
    sudo -E /tmp/scripts/build/install-git-lfs.sh && \
    sudo -E /tmp/scripts/build/install-github-cli.sh && \
    sudo -E /tmp/scripts/build/install-google-cloud-cli.sh && \
    sudo -E /tmp/scripts/build/install-nvm.sh && \
    sudo -E /tmp/scripts/build/install-nodejs.sh && \
    sudo -E /tmp/scripts/build/install-powershell.sh && \
    sudo -E /tmp/scripts/build/configure-dpkg.sh && \
    sudo -E /tmp/scripts/build/install-yq.sh && \
    sudo -E /tmp/scripts/build/install-python.sh && \
    sudo -E /tmp/scripts/build/install-zstd.sh && \
    sudo -E /tmp/scripts/build/install-pipx-packages.sh && \
    sudo -E /tmp/scripts/build/install-docker-cli.sh && \
    sudo -E /tmp/scripts/build/configure-system.sh && \
    sudo -E /tmp/scripts/helpers/cleanup.sh

RUN sudo sed -i '/set -eo pipefail/d' /etc/bash.bashrc

ENTRYPOINT ["/opt/entrypoint.sh"]

CMD [ "bash" ]
