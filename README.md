# pritunl
https://pritunl.com/


## 1. Get image

```
docker pull we87/pritunl
```


## 2. Create container

```
docker run -d -it \
  --privileged \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:443/tcp -p 443:443/tcp \
  --name="pritunl" \
  fridus/pritunl
```

###  Setup on `run`

#### Link to mongo

```
docker run -d -it \
  --privileged \
  --link mongodb:mongo \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:443/tcp -p 443:443/tcp \
  --name="pritunl" \
  fridus/pritunl
```

`/!\` The alias of the mongodb container must be `mongo`

#### Set `Mongo URI`

```
docker run -d -it \
  --privileged \
  --e MONGO_URI=mongodb://xx.xx.xx.xx:27017/pritunl \
  -p 1194:1194/udp -p 1195:1195/udp -p 9700:443/tcp -p 443:443/tcp \
  --name="pritunl" \
  fridus/pritunl
```


## 3. Configure and use

-> https://myvpnserver or https://myvpnserver:9700
