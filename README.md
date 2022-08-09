## Usage

```bash
$ git clone ssh://git@github.com/AtsuhikoYamada/iwtsys.git
$ cd iwtsys
-------- for Linux
$ ./create_project.sh
-------- for Windows
> create_project.bat
--------
$ cd ..
$ git clone git@github.com:iwatatool/prodplan.git
$ sudo cp -rfp prodplan/toglon/* iwtsys/backend/
$ cd iwtsys
-------- for Linux
$ ./laravel_chmod.sh
-------- for Windows
> laravel_chmod.bat
--------
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


