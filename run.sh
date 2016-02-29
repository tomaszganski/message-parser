#!/usr/bin/env bash
source /usr/local/rvm/scripts/rvm

echo "=> Starting Sinatra"
bundle exec thin start
