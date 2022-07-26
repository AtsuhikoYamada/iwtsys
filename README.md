## Create Environment

```bash
$ git clone https://github.com/AtsuhikoYamada/iwtsys.git
$ cd iwtsys
$ make create-project # Install Laravel project
$ make composer-install
$ make npm-install
```

## Share Image

```bash
$ docker commit <container_id> a2ymd/iwt-web
$ docker login
$ docker push a2ymd/iwt-web
$ docker save a2ymd/iwt-web >iwt-web.tar

```

## Program Update

```bash
$ git clone git@github.com:iwatatool/prodplan.git
$ sudo cp -rfp prodplan/toglon/* iwtsys/backend/
$ cd iwtsys
$ make chmod
```

## Database Update
```bash
$ mysql -u root -pROOTPASSWORD -h 127.0.0.1 
```

## Container structure

```bash
├── web
└── db
```

### web container

- Base image
  - [php](https://hub.docker.com/_/php):7.4-apache-buster
  - [composer](https://hub.docker.com/_/composer):2.0
  - [node](https://hub.docker.com/_/node):node:14-buster

### db container

- Base image
  - [mariadb](https://hub.docker.com/_/mariadb):10.8

#### Persistent MariaDB Storage

By default, the [named volume](https://docs.docker.com/compose/compose-file/#volumes) is mounted, so MariaDB data remains even if the container is destroyed.
If you want to delete MariaDB data intentionally, execute the following command.

```bash
$ docker-compose down -v && docker-compose up
```


