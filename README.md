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
## Works with version
- 4.10 as of 18/11/2024

## Credits
This was heavily inspired by White Knight Labs git [repo](https://github.com/WKL-Sec/docker-cobaltstrike), which is based on warhorse's git [repo](https://github.com/warhorse/docker-cobaltstrike).<br>
And this blog [post](https://ezrabuckingham.com/blog/containerizing-red-team-infra/) by Ezra Buckingham
