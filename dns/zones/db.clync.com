$TTL    604800
@       IN      SOA     services.clync.com. contact.clync.com (
                  1     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Minimum
)
; name servers - NS records
    IN      NS      services

; name servers - A records
services.clync.com.          IN      A       172.16.16.220

; Temp Bootstrap Node
bootstrap.okd4.clync.com.        IN      A      172.16.16.200

; Control Plane Nodes
control-1.okd4.clync.com.        IN      A      172.16.16.201
control-2.okd4.clync.com.        IN      A      172.16.16.202
control-3.okd4.clync.com.        IN      A      172.16.16.203

; Worker Nodes
compute-1.okd4.clync.com.        IN      A      172.16.16.204
compute-2.okd4.clync.com.        IN      A      172.16.16.205

; OpenShift Internal - Load balancer
api.okd4.clync.com.     IN    A    172.16.16.220
api-int.okd4.clync.com. IN    A    172.16.16.220
*.apps.okd4.clync.com.  IN    A    172.16.16.220

; ETCD Cluster
etcd-0.okd4.clync.com.    IN    A       172.16.16.201
etcd-1.okd4.clync.com.    IN    A       172.16.16.202
etcd-2.okd4.clync.com.    IN    A       172.16.16.203

; OpenShift Internal SRV records (cluster name = lab)
_etcd-server-ssl._tcp.okd4.clync.com.    86400     IN    SRV     0    10    2380    etcd-0.okd4
_etcd-server-ssl._tcp.okd4.clync.com.    86400     IN    SRV     0    10    2380    etcd-1.okd4
_etcd-server-ssl._tcp.okd4.clync.com.    86400     IN    SRV     0    10    2380    etcd-2.okd4

console-openshift-console.apps.okd4.clync.com.     IN     A     172.16.16.220
oauth-openshift.apps.okd4.clync.com.     IN     A     172.16.16.220
