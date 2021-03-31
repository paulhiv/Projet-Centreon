# contanerised small business infrastructure




The goal of this project is to set up a monitoring infrastructure for a small buisiness that is containerised.

This project contains:
- An helpdesk service containing glpi and Mysql
- A log server in order to optimise future configuration.
- Two NGINX web services as placeholder for production services
- A reverse proxy in order to limit the access points to the public network.
- A Centreon server to monitor the whole of the infrastructure.

## Summary

- [contanerised small business infrastructure](#contanerised-small-business-infrastructure)
  - [Summary](#summary)
  - [Requirements](#requirements)
    - [Services](#services)
      - [Centreon](#centreon)
      - [GLPI](#glpi)
      - [Traefik](#traefik)
      - [Portainer](#portainer)
      - [Prometeus/Graphana](#prometeusgraphana)
    - [Installation](#installation)
      - [Verification](#verification)

## Requirements

hardware requirements:
- 2 physicals threads
- 4 GB of RAM
- 20 GB of free space

SOFTWARE
- CentOS 7 or newer
- Docker version 20.10.5 
- docker-compose version 1.28.5  

### Services

#### Centreon

- Centreon has different folders required for its configuration:
    - Centreon-engine
    - Centreon-Engine-var-lib
    - Centreon-Engine-Connector
    - Centreon-Engine-Library
    - Centreon-Plugins

:exclamation: Centreon runs in privileged mode thus it needs root access to the cgroups of the host machine account and must not be exposed to the public network.

#### GLPI

GLPI has different configuration folders:
    - mysql-glpi
    - glpi

#### Traefik
 -  redirects web services to:
    - http://siteweb_1.test.xy
    - http://siteweb_2.test.xy

#### Portainer

Portainer allows the configuration of docker through a web interface with the address localhost:9000.

#### Prometeus/Graphana

it monitors the database of GLPI and Traefik.

It's configuration file is located [ici](./prometheus/prometheus.yml).

### Installation

- 1. Clone the git with thge command ```git clone https://github.com/paulhiv/Projet-Centreon.git```
- 2. Navigate to the project directory
- 3. Run ```docker-compose up```
- 4. Run ```docker exec -it centreon sh``` to access the centreon container's shell
- 5. Run ``` /entrypoint.sh```
- 6. Finally, run ```su centreon service centreon-engine start```

#### Verification

 - GLPI
    - http://192.168.1.197:8090

- Centreon
    - http://192.168.1.197:8091

- Traefik
    - http://192.168.1.197:8080

- Siteweb 1
    - http://siteweb_1.test.xy

- Siteweb 2
    - http://siteweb_2.test.xy

- Graphana
    - http://192.168.1.197:3000

- Prometheus
    - http://192.168.1.197:9090

- Portainer
    - http://192.168.1.197:9000