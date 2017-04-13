
# Usage


### Get
```shell
$ docker pull daspanel/redis:latest
```

### Run
```shell
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-redis daspanel/redis:latest
```

### Stop
```shell
$ docker stop my-redis
```

### Update image
```shell
$ docker stop my-redis
$ docker pull daspanel/redis:latest
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-redis daspanel/redis:latest
```

# Tips
