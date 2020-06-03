# Create a base freesurfer docker container 
#
# Note: The resulting container is ~3GB. 
# 
# Example build:
#   docker build --no-cache -t vistalab/freesurfer-core .
#
# Example usage:
#   docker run -ti \
#       -v /input/directory:/input \
#       -v `/output/directory:/output \
#       vistalab/freesurfer-core \
#       mri_convert -at /input/inputvolume.m3z /output/outvolume.mgz
#

# Start with ubuntu
FROM centos:7

# Remove Debconf Dialog warnings:
# RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install dependencies for FS
# Download FS_v7.1.0 from MGH and untar to /opt
RUN apt-get update \
    && apt-get -y install tcsh tar wget libgomp1 perl-modules bc dialog apt-utils \
    && wget -N -qO- ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.1.0/freesurfer-linux-centos6_x86_64-7.1.0.tar.gz | tar -xzv -C /opt \
    && rm -rf /opt/freesurfer/subjects/* \
    && rm -rf /opt/freesurfer/average/* \
    && rm -rf /opt/freesurfer/trctrain/* \
    && mkdir /output

# Configure license 
# COPY license /opt/freesurfer/.license

# Configure basic freesurfer ENV
ENV OS Linux
ENV FS_OVERRIDE 0
ENV FIX_VERTEX_AREA= 
ENV SUBJECTS_DIR /output
ENV FSF_OUTPUT_FORMAT nii.gz
ENV MNI_DIR /opt/freesurfer/mni
ENV LOCAL_DIR /opt/freesurfer/local
ENV FREESURFER_HOME /opt/freesurfer
ENV FSFAST_HOME /opt/freesurfer/fsfast
ENV MINC_BIN_DIR /opt/freesurfer/mni/bin
ENV MINC_LIB_DIR /opt/freesurfer/mni/lib
ENV MNI_DATAPATH /opt/freesurfer/mni/data
ENV FMRI_ANALYSIS_DIR /opt/freesurfer/fsfast
ENV PERL5LIB /opt/freesurfer/mni/lib/perl5/5.8.5
ENV MNI_PERL5LIB /opt/freesurfer/mni/lib/perl5/5.8.5
ENV PATH /opt/freesurfer/bin:/opt/freesurfer/fsfast/bin:/opt/freesurfer/tktools:/opt/freesurfer/mni/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Configure bashrc to source FreeSurferEnv.sh
RUN /bin/bash -c ' echo -e "source $FREESURFER_HOME/FreeSurferEnv.sh &>/dev/null" >> /root/.bashrc '

ENTRYPOINT [ "tail", "-f", "/dev/null" ]