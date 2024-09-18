IPADDRESS="$(ip address | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d''/)"

docker run \
  --mount type=bind,source="$(pwd)",target=/opt/cobaltstrike/mount \
  -p 50050:50050 \
  -p 9050:9050 \
  -p 9051:9051 \
  -p 9052:9052 \
  -p 9053:9053 \
  -p 9054:9054 \
  -p 9055:9055 \
  -p 9056:9056 \
  -p 443:443 \
  -p 4443:4443 \
  -p 4444:4444 \
  -p 4445:4445 \
  -p 4446:4446 \
  -p 4447:4447 \
  -p 4448:4448 \
  -p 4449:4449 \
  -p 80:80 \
  cobaltstrike \
  $IPADDRESS \
  password \
  /opt/cobaltstrike/mount/c2.profile
