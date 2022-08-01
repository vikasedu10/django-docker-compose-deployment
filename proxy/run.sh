#!bin/sh

set -e

# The envsubst line is a tool used to substitute environment variables in a file — this is what replaces the ${EN_VAR} syntax with the actual value set in environment variables which we use for configuration.
# It will put values from the ENV variables (that are mentioned in 'Dockerfile' (in current dir), that (ENV variables) gets created and then later 'run.sh' execute will put those ENV values in 'default.conf.tpl' placeholders)
# Empty file in 'Dockerfile' is create as '/etc/nginx/conf.d/default.conf' so the output produced can be directly added to the file.
envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf

# Run this 'nginx daemon service' in forground (Background mode = Run in the background continuously without stopping (like daemon). Foreground or console = If you exit console the process may stop.)
nginx -g 'daemon off;'
