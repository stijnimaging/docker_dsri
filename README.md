## Clone

```bash
git clone 
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

