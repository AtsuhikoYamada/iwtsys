## Usage

```bash
$ git clone git@github.com:a2ymd/iwtsys.git
$ cd iwtsys
$ ./create_project.sh
$ cd ..
$ git clone git@github.com:iwatatool/prodplan.git
$ sudo cp -rfp prodplan/toglon/* iwtsys/backend/
$ cd iwtsys
$ ./laravel_chmod.sh
$ mysql -u root -pXXXX -h 127.0.0.1 # use tisc3; source /home/xxx/tisc3.sql
```

## Container structure

```bash
├── web
└── db
```

### web container

- Base image
  - [iwt-web](https://hub.docker.com/a2ymd):latest

### db container

- Base image
  - [iwt-db](https://hub.docker.com/a2ymd):latest

#### Persistent MariaDB Storage

By default, the [named volume](https://docs.docker.com/compose/compose-file/#volumes) is mounted, so MariaDB data remains even if the container is destroyed.
If you want to delete MariaDB data intentionally, execute the following command.

```bash
$ docker compose down -v && docker compose up -d
```


