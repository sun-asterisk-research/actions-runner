#!/bin/bash -e
################################################################################
##  File:  install-powershell.sh
##  Desc:  Install PowerShell Core
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/install.sh
source $HELPER_SCRIPTS/os.sh

pwsh_version=$(get_toolset_value .pwsh.version)

# Install libicu dependency for PowerShell
if is_ubuntu24; then
    # Ubuntu 24.04 uses libicu74
    apt-get install -y libicu74
elif is_ubuntu22; then
    # Ubuntu 22.04 uses libicu70
    apt-get install -y libicu70
fi

# Install Powershell
apt-get install -y powershell=$pwsh_version*
