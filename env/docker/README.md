

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