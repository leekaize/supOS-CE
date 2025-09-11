#!/bin/bash

# This script defines colored logging functions for use in other scripts.

# Define Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

info() {
    # Blue color for informational messages
    echo -e "${NC}[INFO] $(date '+%Y-%m-%d %H:%M:%S') - $1${NC}"
}

success() {
    # Green color for success messages
    echo -e "${GREEN}[SUCCESS] $(date '+%Y-%m-%d %H:%M:%S') - $1${NC}"
}

warn() {
    # Yellow color for warnings, sent to stderr
    echo -e "${YELLOW}[WARN] $(date '+%Y-%m-%d %H:%M:%S') - $1${NC}" >&2
}

error() {
    # Red color for errors, sent to stderr
    echo -e "${RED}[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - $1${NC}" >&2
}