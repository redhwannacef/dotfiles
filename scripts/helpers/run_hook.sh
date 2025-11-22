#!/usr/bin/env bash

run_hook() {
  local log_message="$1"
  local hook_name="$2"

  shift 2

  if declare -f "$hook_name" >/dev/null; then
    echo -e "$log_message"
    "$hook_name" "$@"
  fi
}
