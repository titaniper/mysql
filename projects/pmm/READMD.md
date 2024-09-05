#  Percona Monitoring and Management (PMM)
- https://hub.docker.com/r/percona/pmm-server
- https://github.com/percona/pmm/blob/main/docker-compose.yml

```
docker-compose down -v; docker-compose up -d



docker-compose logs pmm-server | grep -i 'password'

docker-compose logs pmm-client | grep -i 'password'

docker-compose exec pmm-client pmm-admin add mysql --username=root --password=1234 --host=mysql.com --port=3306 --query-source=perfschema
```