FROM debian:stretch
RUN apt-get update
RUN apt-get install -y git g++ python python-numpy libeigen3-dev zlib1g-dev libqt4-opengl-dev libgl1-mesa-dev libfftw3-dev libtiff5-dev
RUN git clone https://github.com/MRtrix3/mrtrix3.git
RUN cd mrtrix3 && ./configure && ./build && ./set_path
ENTRYPOINT ["tail", "-f", "/dev/null"]
