# infrasture informatique pour une petite entreprise
ce projet a pour but de monter une petite infrastructure monitoré et conteneurisé idéale pour une startup

Elle contient plusieurs services comme:
    - Un service de ticket informatique (glpi + Mysql)
    - un serveur de log pour optimiser les configurations futures
    - 2 sites web NGINX en tant qu'exemple de service de production
    - Un reverse proxy afin de limiter les point d'accès réseau au public aux sites web
    - Un serveur Centreon afin de superviser l'ensemble du parc informatique

## Table des Matières

1. [Pré-requis](###Pré-requis)
2. [services](###services)
2.1 [centreon](####centreon)
2.2 [GLPI](####GLPI)
2.3 [Traefik](####Traefik)
2.4 [portainer](####portainer)
2.5 [prometeus/graphana](####prometeus/graphana)
3. [Installation](###Installation-example)
3.1 [Vérification](####Vérification)

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

### services

#### centreon

Centreon comporte des dossiers nécessaires à sa configuration:
    - centreon-engine
    - Centreon-Engine-var-lib
    - Centreon-Engine-Connector
    - Centreon-Engine-Library
    - Centreon-Plugins

:exclamation: centreon tourne en mode privilégié et donc a accès root au cgroups de la machine hôte et ne doit en aucun cas être exposé au réseau public.

#### GLPI

GLPI contient des dossiers de configuration:
    - mysql-glpi
    - glpi


#### Traefik

Redirige les services web vers:
    - http://siteweb_1.test.xy
    - http://siteweb_1.test.xy

#### portainer

Il permet la gestion de docker via une interface graphique sur localhost:9000

#### prometeus/graphana

Il supervise le traefik ainsi que la base de donnée de GLPI.
Son fichier de configuration se trouve [ici](./prometheus/prometheus.yml)

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