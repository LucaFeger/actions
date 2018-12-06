#!/bin/sh

# Stop after non zero exit code
set -e

SSH_PATH="/github/home/.ssh"

mkdir "$SSH_PATH"
touch "$SSH_PATH/known_hosts"

echo "$PRIVATE_KEY" > "$SSH_PATH/deploy_key"
echo "$PUBLIC_KEY" > "$SSH_PATH/deploy_key.pub"

chmod 700 "$SSH_PATH"
chmod 600 "$SSH_PATH/known_hosts"
chmod 600 "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key.pub"

eval $(ssh-agent)
ssh-add "$SSH_PATH/deploy_key"

ssh-keyscan -t rsa $HOST >> "$SSH_PATH/known_hosts"

docker login --username $DOCKER_USERNAME --pasword $DOCKER_PASSWORD


if [ -z "$DOCKER_PARAMETERS" ]; then

ssh -A -tt -o 'StrictHostKeyChecking=no' $USER@$HOST << EOF
docker stop $(docker ps -a -q  --filter ancestor=$1)
docker rm $(docker ps -a -q  --filter ancestor=$1)
docker rmi $1
docker run -d $1
EOF

else

ssh -A -tt -o 'StrictHostKeyChecking=no' $USER@$HOST << EOF
docker stop $(docker ps -a -q  --filter ancestor=$1)
docker rm $(docker ps -a -q  --filter ancestor=$1)
docker rmi $1
docker run $DOCKER_PARAMETERS -d $1
EOF

fi