# OpenLane_GUI
This repository is to use GUI such as KLayout and magic of OpenLane.
![klayout](img/klayout_up.png)

## How to use
Following commands execute docker-compose and docker to build gui/Dockerfile.
This gui environment invokes ssh-server in docker container.
Users can login ssh command and display GUI via X11 forwarding.
- docker-compose build
- docker-compose up
- ./run_ssh

## RTL sample for newly created design
Following design is very simple clocked inverter logic.
- design/new_design/src/new_design.v
- design/new_design/src/new_design.sdc
