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


docker run  --entrypoint /bin/ash --rm -it -u$UID:$GID -w$PWD -v$PWD:$PWD -v /var/run/docker.sock:/var/run/docker.sock docker-compose

docker run   --rm -it -u0:0 -w$PWD -v$PWD:$PWD -v /var/run/docker.sock:/var/run/docker.sock docker-compose  -f simple.yml up -d

curl -H "Access-Control-Request-Method: GET" -H "Origin: http://localhost" --head http://localhost

https://www.simplified.guide/ssh/run-multiple-ports

sudo ssh -L 5000:localhost:5000 192.168.178,210
sudo ssh -L 80:localhost:80 192.168.178,210

docker tag debian:buster localhost:5000/debian:buster
docker push localhost:5000/debian

https://mesosphere.github.io/marathon/docs/native-docker-private-registry.html

 docker login http://localhost:5000