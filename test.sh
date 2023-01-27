#!/bin/env bash

cat <<- EOF
users:
  - default
  - name: infradog
    sudo: ALL=(ALL) NOPASSWD:ALL
    shell: /bin/bash
    ssh_authorized_keys:
      - $(cat id_ed25519.pub)
EOF