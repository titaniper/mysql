

````
ALTER USER 'orm'@'*' IDENTIFIED WITH mysql_native_password BY 'orm';

-- 어떤 호스트에서든 접속 가능한 사용자에게 모든 데이터베이스에 대한 모든 권한 부여
GRANT ALL PRIVILEGES ON *.* TO 'orm'@'%' WITH GRANT OPTION;

-- 권한 변경사항 즉시 적용
FLUSH PRIVILEGES;
```


````
ifconfig
```


```
network_mode: "host"
```


````
apiVersion: v1
kind: Service
metadata:
  name: mysql-external
spec:
  type: ExternalName
  externalName: host.docker.internal

```