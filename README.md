## Clone

```bash
git clone https://github.com/stijnimaging/docker_dsri.git
cd docker_dsri
```

## Freesurfer

### Build

```bash
cd freesurfer
docker build -t umdsri/freesurfer .
```

### Run

From [DockerHub vemonet/freesurfer](https://hub.docker.com/repository/docker/vemonet/freesurfer):

```bash
docker run -it --rm --name freesurfer umdsri/freesurfer
```

### Connect

To connect to a running freesurfer container using SSH:

```bash
docker exec -it freesurfer bash
```

### Test

```bash
recon-all
```