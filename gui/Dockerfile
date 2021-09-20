FROM efabless/openlane

ARG USER=user
ARG USER_ID=501
ARG GROUP_ID=20
ARG PASS=password

RUN yum install -y openssh-server vim

RUN useradd --uid $USER_ID --groups $GROUP_ID -m -s /bin/bash $USER
RUN echo "${USER}:${PASS}" | chpasswd

# SSH settings. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -e 's@#Port 22@Port 22@' -e 's@#AddressFamily any@AddressFamily inet@' -i /etc/ssh/sshd_config

RUN ssh-keygen -A

USER $USER
WORKDIR /home/$USER

RUN echo 'export LANG=C' >> /home/$USER/.bash_profile
RUN echo 'alias ls="ls -a --color=auto --show-control-chars --time-style=long-iso -FH"' >> /home/$USER/.bash_profile
RUN echo 'alias ll="ls -a -lA"' >> /home/$USER/.bash_profile
RUN echo 'alias h=history' >> /home/$USER/.bash_profile
RUN echo 'alias vi=vim' >> /home/$USER/.bash_profile
RUN echo 'syntax on' >> /home/$USER/.vimrc

RUN echo 'export PATH=/openLANE_flow:/openLANE_flow/scripts:/build//bin:/build//bin/Linux-x86_64:/build//pdn/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /home/$USER/.bash_profile
RUN echo 'export OPENLANE_ROOT=/openLANE_flow' >> /home/$USER/.bash_profile
RUN echo 'export PDK_ROOT=/openLANE_flow/pdks' >> /home/$USER/.bash_profile
RUN echo alias 'kl="klayout -l /openLANE_flow/pdks/sky130A/libs.tech/klayout/sky130A.lyp $@"' >> /home/$USER/.bash_profile
RUN echo 'function mdef() { def=$1; tmpdir=`dirname $def`; lef=`echo $tmpdir/*.lef`; magic -T $PDK_ROOT/sky130A/libs.tech/magic/sky130A.tech lef read $lef def read $def; }' >> /home/$USER/.bash_profile

USER root

EXPOSE 22
