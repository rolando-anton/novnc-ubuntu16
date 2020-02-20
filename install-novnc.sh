#!/bin/bash

sudo apt-get install -y \
xfce4 \
git \
x11vnc \
xvfb \
wget \
python \
python-numpy \
unzip \
&& \
cd $HOME
git clone https://github.com/kanaka/noVNC.git && \
cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify


cat > novnc.sh << EOF 
#!/bin/bash

export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5
xfce4-session&
x11vnc -display :1 -listen localhost -xkb -forever &
cd $HOME/noVNC && cp vnc.html index.html && sudo ./utils/launch.sh --listen 80 --vnc localhost:5900 &

EOF
