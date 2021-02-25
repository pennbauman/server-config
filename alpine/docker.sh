apk add docker
addgroup root docker

rc-update add docker boot
service docker start
