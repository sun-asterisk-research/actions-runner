#!/bin/bash -e
################################################################################
##  File:  os.sh
##  Desc:  Helper functions for OS releases
################################################################################

is_ubuntu20() {
    lsb_release -d | grep -q 'Ubuntu 24'
}

is_ubuntu22() {
    lsb_release -d | grep -q 'Ubuntu 22'
}
