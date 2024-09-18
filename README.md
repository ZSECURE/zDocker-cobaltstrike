# zDocker-cobaltstrike

## Set your CS License key in an Environment Variable
```bash
export COBALTSTRIKE_LICENSE="<cobaltstrike_license"
```
## Build the docker container
```bash
sudo docker build -t cobaltstrike:latest --build-arg COBALTSTRIKE_LICENSE=$COBALTSTRIKE_LICENSE .
```

## Run the container and expose the ports
```bash
sudo ./docker.sh
```
