# OS
FROM    ubuntu:xenial

# OS packages
RUN     apt-get update \
&&      apt-get upgrade \
            --yes \
&&      apt-get install \
            --yes \
            apt-utils \
            git \
            python-pip \
            virtualenv

# Python packages
ADD     requirements.txt /code/requirements.txt
RUN     virtualenv \
            --no-site-packages \
            --python=$(which python2.7) \
            /code/venv
RUN     /code/venv/bin/pip install \
            --requirement /code/requirements.txt

# Run
WORKDIR /code
