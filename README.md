# Containerised small business infrastructure




The goal of this project is to set up a monitoring infrastructure for a small buisiness that is containerised.

This project contains:
- An helpdesk service containing glpi and Mysql
- A log server in order to optimise future configuration.
- Two NGINX web services as placeholder for production services
- A reverse proxy in order to limit the access points to the public network.
- A Centreon server to monitor the whole of the infrastructure.

## Summary

- [Containerised small business infrastructure](#containerised-small-business-infrastructure)
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
- [Infrastucture informatique pour une petite entreprise](#infrastucture-informatique-pour-une-petite-entreprise)
  - [Table des Matières](#table-des-matières)
    - [Pré-requis](#pré-requis)
    - [Services](#services-1)
      - [Centreon](#centreon-1)
      - [GLPI](#glpi-1)
      - [Traefik](#traefik-1)
      - [Portainer](#portainer-1)
      - [Prometeus/Graphana](#prometeusgraphana-1)
    - [Installation](#installation-1)
      - [Vérification](#vérification)

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

Français:

# Infrastucture informatique pour une petite entreprise


- Ce projet a pour but de monter une petite infrastructure supervisée et conteneurisée idéale pour une startup.

- Elle contient plusieurs services comme:
    - Un service de ticket informatique (glpi + Mysql).
    - Un serveur de log pour optimiser les configurations futures.
    - 2 sites web NGINX en tant qu'exemple de service de production.
    - Un reverse proxy afin de limiter les point d'accès réseau au public aux sites web.
    - Un serveur Centreon afin de superviser l'ensemble du parc informatique.

## Table des Matières

- [Containerised small business infrastructure](#containerised-small-business-infrastructure)
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
- [Infrastucture informatique pour une petite entreprise](#infrastucture-informatique-pour-une-petite-entreprise)
  - [Table des Matières](#table-des-matières)
    - [Pré-requis](#pré-requis)
    - [Services](#services-1)
      - [Centreon](#centreon-1)
      - [GLPI](#glpi-1)
      - [Traefik](#traefik-1)
      - [Portainer](#portainer-1)
      - [Prometeus/Graphana](#prometeusgraphana-1)
    - [Installation](#installation-1)
      - [Vérification](#vérification)

### Pré-requis

Pour les pré-requis, il faut comme spécification physique:

HARDWARE
- 2 coeurs physiques
- 4 GB de RAM
- 20 GB d'espace disque

SOFTWARE
- CentOS 7 ou supérieur
- Docker version 20.10.5
- docker-compose version 1.28.5

### Services

#### Centreon

- Centreon comporte des dossiers nécessaires à sa configuration:
    - Centreon-engine
    - Centreon-Engine-var-lib
    - Centreon-Engine-Connector
    - Centreon-Engine-Library
    - Centreon-Plugins

:exclamation: centreon tourne en mode privilégié et donc a accès root au cgroups de la machine hôte et ne doit en aucun cas être exposé au réseau public.

#### GLPI

- GLPI contient des dossiers de configuration:
    - mysql-glpi
    - glpi


#### Traefik

- Redirige les services web vers:
    - http://siteweb_1.test.xy
    - http://siteweb_2.test.xy

#### Portainer

Il permet la gestion de docker via une interface graphique sur localhost:9000.

#### Prometeus/Graphana

Il supervise le traefik ainsi que la base de donnée de GLPI.
Son fichier de configuration se trouve [ici](./prometheus/prometheus.yml).

### Installation

- 1. Cloner le git via la commande ```git clone https://github.com/paulhiv/Projet-Centreon.git```
- 2. Rentrer dans le répertoire du projet
- 3. Lancer la commande ```docker-compose up```
- 4. Lancer la commande ```docker exec -it centreon sh``` pour accéder au shell du conteneur centreon
- 5. Enfin, lancer ``` /entrypoint.sh```
- 6. Executer la commande ```su centreon service centreon-engine start```

#### Vérification

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