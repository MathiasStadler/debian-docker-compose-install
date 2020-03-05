# debian-docker-compose-install
debian install docker-compose direct


## install docker-composer-ce on stretch copy and paste method

```bash
INSTALL_DOCKER_COMPOSER_CE="install-docker-composer-ce.sh"
cat <<EOF >"$INSTALL_DOCKER_COMPOSER_CE"
#!/bin/bash
cd /tmp
# from here https://gist.github.com/wdullaer/f1af16bd7e970389bad3
COMPOSE_VERSION=$(git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oP "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | tail -n 1)
echo "Used docker-compose version ${COMPOSE_VERSION}"
sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"

echo "run than for simple test: docker-compose -v"
echo "thx!!!"
EOF
chmod +x $INSTALL_DOCKER_COMPOSER_CE
```

docker run -u$UID:$GID -w$PWD -v$PWD:$PWD docker-compose -f simple.yml up -d
