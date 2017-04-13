
# Usage


### Get
```shell
$ docker pull daspanel/daspanel-redis:latest
```

### Run
```shell
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-daspanel-redis daspanel/daspanel-redis:latest
```

### Stop
```shell
$ docker stop my-daspanel-redis
```

### Update image
```shell
$ docker stop my-daspanel-redis
$ docker pull daspanel/daspanel-redis:latest
$ docker run -e DASPANEL_MASTER_EMAIL=my@email.com --name=my-daspanel-redis daspanel/daspanel-redis:latest
```

# Tips
