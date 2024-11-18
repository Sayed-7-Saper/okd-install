$TTL	86400  ; 24 hours could have been written as 24h or 1D

@ IN SOA okd4-services.clync.com. (
        admin.clync.com. ; responsible party
        2022072001  ; serial
        3H  ; refresh
        15  ; retry
        1w  ; expire
        3h  ; minimum
)

; name servers - NS records
  IN NS services

; name server - A records
services.clync.com. IN A 172.16.16.220

; okd4 container platform cluster - A records
bootstrap.okd4.clync.com.	IN A 172.16.16.200
control-1.okd4.clync.com.	IN A 172.16.16.201
control-2.okd4.clync.com.       IN A 172.16.16.202
control-3.okd4.clync.com.       IN A 172.16.16.203
compute-1.okd4.clync.com.	IN A 172.16.16.204
compute-2.okd4.clync.com.       IN A 172.16.16.205

; okd4 internal cluster IPs - A records
api.okd4.clync.com.     IN A 172.16.16.220
api-int.okd4.clync.com. IN A 172.16.16.220
*.apps.okd4.clync.com.  IN A 172.16.16.220
etcd-0.okd4.clync.com.  IN A 172.16.16.201
etcd-1.okd4.clync.com.  IN A 172.16.16.202
etcd-2.okd4.clync.com.  IN A 172.16.16.203
console-openshift-console.apps.okd4.clync.com. IN A 172.16.16.220
oauth-openshift.apps.okd4.clync.com. IN A 172.16.16.220


; okd4 internal cluster IPs - SRV records
_etcd-server-ssl._tcp.okd4.clync.com. 86400 IN SRV 0 10 2380 etcd-0.okd4
_etcd-server-ssl._tcp.okd4.clync.com. 86400 IN SRV 0 10 2380 etcd-1.okd4
_etcd-server-ssl._tcp.okd4.clync.com. 86400 IN SRV 0 10 2380 etcd-2.okd4
