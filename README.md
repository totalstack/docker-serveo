# docker-serveo
Serveo is an SSH server just for remote port forwarding. When a user connects to Serveo, they get a public URL that anybody can use to connect to their localhost server.
Dockerfile will build an image with Debian "jessie" and this image will allow the remote port forwarding using Serveo.

## Procedures
### 1. Build an Image using Dockerfile
To create an image
```
docker build -t serveo:latest .
```
* -t = set the image tag name and version.
* . = the location of Dockerfile

### 2. Create the containers using the serveo image
Before creating the container:
* Check the LOCAL_PORT of Docker host.
* Change the REMOTE_HOST for particular subdomain
* Change the REMOTE_PORT "usually its 80 to forward http traffic".

To create the container and allow the remote port forwarding.
```
docker run --rm -ti -e LOCAL_HOST=$(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | head -n1 | awk '{print $2}' | cut -d: -f2) -e LOCAL_PORT=8000 -e REMOTE_HOST=audioslug -e REMOTE_PORT=80 serveo:latest
```

