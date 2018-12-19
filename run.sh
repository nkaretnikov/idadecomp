#!/usr/bin/env bash

set -euxo pipefail

IDA="$1"; shift    # path to IDA
INPUT="$1"; shift  # input file
EA="$1"; shift     # function address to decompile

PWD=$(pwd)
TTY=$(tty)

ARGS=()
#ARGS+=( -a)  # disable auto analysis
#ARGS+=( -a-)  # enable auto analysis
ARGS+=( -A)  # do not display dialog boxes
ARGS+=( "-S$PWD/idadecomp.py $TTY $EA")

# Remove PATH to avoid issues with Python imports.
env -u PATH "$IDA" "${ARGS[@]}" "$INPUT"
