#!/bin/bash

if [[ ! -d "venv" ]]; then
  echo "no virtualenv found, going to try to create a /venv"
  virtualenv venv
  if [[ ! -d "venv" ]]; then
    echo "Couldn't create your virtual environment, please create a /venv " \
         "and try again."
    exit
  fi
fi

source venv/bin/activate
INSTALLED=$(pip freeze | grep codewars_test)
if [[ -z $INSTALLED ]]; then
  pip install -U codewars_wheel/codewars_test-*.whl
else
  echo "You already have codewars_test installed in your venv!"
fi

deactivate
echo "Finished~"
