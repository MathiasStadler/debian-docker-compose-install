#!/bin/bash
sudo apt-get -y remove docker docker-engine docker.io
# from here https://gist.github.com/wdullaer/f1af16bd7e970389bad3
COMPOSE_VERSION=1.25.2
sudo sh -c "curl -L https://github.com/docker/compose/releases/download//docker-compose-Linux-aarch64 > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose//contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

echo "run than for simple test: docker-compose -v"
echo "thx!!!"
