$TTL    604800
@       IN      SOA     okd4-services.clync.com. admin.clync.com. (
                  1     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Negative Cache TTL
)

; name servers - NS records
    IN      NS      okd4-services

; name servers - A records
okd4-services.clync.com.          IN      A       172.16.16.220

; OpenShift Container Platform Cluster - A records
okd4-bootstrap.lab.clync.com.        IN      A      172.16.16.200
okd4-control-1.lab.clync.com.        IN      A      172.16.16.201
okd4-control-2.lab.clync.com.         IN      A      172.16.16.202
okd4-control-3.lab.clync.com.         IN      A      172.16.16.203
okd4-compute-1.lab.clync.com.        IN      A      172.16.16.204
okd4-compute-2.lab.clync.com.        IN      A      172.16.16.205

; OpenShift internal cluster IPs - A records
api.lab.clync.com.    IN    A    172.16.16.220
api-int.lab.clync.com.    IN    A    172.16.16.220
*.apps.lab.clync.com.    IN    A    172.16.16.220
etcd-0.lab.clync.com.    IN    A     172.16.16.201
etcd-1.lab.clync.com.    IN    A     172.16.16.202
etcd-2.lab.clync.com.    IN    A    172.16.16.203
console-openshift-console.apps.lab.clync.com.     IN     A     172.16.16.220
oauth-openshift.apps.lab.clync.com.     IN     A     172.16.16.220

; OpenShift internal cluster IPs - SRV records
_etcd-server-ssl._tcp.lab.clync.com.    86400     IN    SRV     0    10    2380    etcd-0.lab
_etcd-server-ssl._tcp.lab.clync.com.    86400     IN    SRV     0    10    2380    etcd-1.lab
_etcd-server-ssl._tcp.lab.clync.com.    86400     IN    SRV     0    10    2380    etcd-2.lab

