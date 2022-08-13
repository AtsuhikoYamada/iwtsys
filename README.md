## Usage

## Create Development Environment for Linux
```bash
$ git clone ssh://git@github.com/iwatatool/prodplan.git
$ sudo rm -rf prodplan/toglon      # DELETE prodplan/toglon
$ git clone ssh://git@github.com/AtsuhikoYamada/iwtsys.git
$ cd iwtsys
$ vi .env    # If you need modify
$ ./dockerup.sh
$ ./create_project.sh
$ cd ../prodplan
$ sudo chown -R <user>.<group> toglon
$ git checkout toglon
$ cd ../iwtsys
$ ./laravel_chmod.sh
$ mysql -u root -pXXXX -h 127.0.0.1 # use tisc3; source /home/xxx/tisc3.sql
```

## Create Development Environment for Windows
```bash
> git clone ssh://git@github.com/iwatatool/prodplan.git
> cd prodplan         # DELETE prodplan/toglon
> rmdir /s toglon     # DELETE prodplan/toglon
> cd ..
> git clone ssh://git@github.com/AtsuhikoYamada/iwtsys.git
> cd iwtsys
> notepad .env   # If you need modify
> dockerup.bat
> create_project.bat
> cd ../prodplan
> git checkout toglon
> cd ../iwtsys
> laravel_chmod.bat
> mysql -u root -pXXXX -h 127.0.0.1 # use tisc3; source /home/xxx/tisc3.sql
```

## Database Update
```bash
$ mysql -u root -pROOTPASSWORD -h 127.0.0.1 
```

## Container structure

```bash
├── web
├── phpmyadmin
└── db
```

### web container

- Base image
  - [iwt-web](https://hub.docker.com/r/a2ymd):latest

### db container

- Base image
  - [iwt-db](https://hub.docker.com/r/a2ymd):latest

### phpmyadmin container

- Base image
  - [phpmyadmin](https://hub.docker.com/_/phpmyadmin):latest

#### Persistent MariaDB Storage

By default, the [named volume](https://docs.docker.com/compose/compose-file/#volumes) is mounted, so MariaDB data remains even if the container is destroyed.
If you want to delete MariaDB data intentionally, execute the following command.

```bash
$ docker compose down -v && docker compose up -d
```


