#!/bin/bash
set -e

# Go to the directory where this script lives
cd "$(dirname "$0")"

# Run common setup
./setup.sh

# Run TS Prisma migrations
./setup_ts.sh
