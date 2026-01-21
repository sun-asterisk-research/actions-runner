#!/bin/bash -e
################################################################################
##  File:  os.sh
##  Desc:  Helper functions for OS releases
################################################################################

is_ubuntu22() {
    lsb_release -rs | grep -q '22.04'
}

is_ubuntu20() {
    lsb_release -rs | grep -q '24.04'
}