## Clone

```bash
git clone https://github.com/stijnimaging/docker_dsri.git
cd docker_dsri
```

## Freesurfer

### Build

```bash
cd freesurfer
docker build -t vemonet/freesurfer .
```

### Run

From [DockerHub vemonet/freesurfer](https://hub.docker.com/repository/docker/vemonet/freesurfer):

```bash
docker run -it --rm --name freesurfer vemonet/freesurfer
```

### Connect

To connect to a running freesurfer container using SSH:

```bash
docker exec -it freesurfer bash
```

