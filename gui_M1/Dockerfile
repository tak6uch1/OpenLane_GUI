FROM efabless/openlane

ARG PASS=password

RUN yum install -y openssh-server vim

RUN echo "root:${PASS}" | chpasswd

# SSH settings. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -e 's@#Port 22@Port 22@' -e 's@#AddressFamily any@AddressFamily inet@' -i /etc/ssh/sshd_config
#RUN sed -e 's@SendEnv LANG@#SendEnv LANG@' -i /etc/ssh/ssh_config
RUN echo "LANG=en_US.utf-8" >> /etc/environment
RUN echo "LC_ALL=en_US.utf-8" >> /etc/environment

RUN ssh-keygen -A

WORKDIR /root

RUN echo 'export LANG=C' >> /root/.bashrc
RUN echo 'alias ls="ls -a --color=auto --show-control-chars --time-style=long-iso -FH"' >> /root/.bashrc
RUN echo 'alias ll="ls -a -lA"' >> /root/.bashrc
RUN echo 'alias h=history' >> /root/.bashrc
RUN echo 'alias vi=vim' >> /root/.bashrc
RUN echo 'syntax on' >> /root/.vimrc

RUN echo 'export PATH=/openLANE_flow:/openLANE_flow/scripts:/build//bin:/build//bin/Linux-x86_64:/build//pdn/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /root/.bashrc
RUN echo 'export OPENLANE_ROOT=/openLANE_flow' >> /root/.bashrc
RUN echo 'export PDK_ROOT=/openLANE_flow/pdks' >> /root/.bashrc
RUN echo alias 'kl="klayout -l /openLANE_flow/pdks/sky130A/libs.tech/klayout/sky130A.lyp $@"' >> /root/.bashrc
RUN echo 'function mdef() { def=$1; tmpdir=`dirname $def`; lef=`echo $tmpdir/*.lef`; magic -T $PDK_ROOT/sky130A/libs.tech/magic/sky130A.tech lef read $lef def read $def; }' >> /root/.bashrc

EXPOSE 22
