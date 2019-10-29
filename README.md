# Development environment
A little bit modified [SeaStar](https://github.com/scylladb/seastar/blob/master/doc/building-docker.md) environment build. 
Recommended at least `11GB` of free memory.

**Requirements**: `docker`, `docker-compose`.

Create the image if does not exist and launch the container:
```bash
docker-compose up -d
```
Thus you can use remote development ([example](https://blog.jetbrains.com/clion/2018/09/initial-remote-dev-support-clion/)) using `ssh://scylla@localhost:7776` and password `dev`. Solutions to potential problems are [here](ISSUES.md).

Stop the container:
```bash
docker-compose down
```