#!/bin/bash
#
# Set the required hosts.

source env.sh

for h in $(compgen -A variable | grep "HOST_"); do
  if grep -q " ${!h}" /etc/hosts; then
    echo_info "Host ${!h} already setted."
  else
    sudo echo "127.0.0.1 ${!h}" >> /etc/hosts
    if [[ $? -eq 0 ]]; then
      echo_success "Host ${!h} setted."
    else
      echo_danger "Host ${!h} cannot be setted."
    fi
  fi
done
