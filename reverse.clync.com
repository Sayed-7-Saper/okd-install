$TTL 604800
@ IN SOA services.clync.com. (
        admin.clync.com.  ; responsible party 
        2022072001  ; serial
        3H  ; refresh
        15  ; retry
        1w  ; expire
        3h  ; minimum
)

; name servers - NS records
@ IN NS services.clync.com.

; name servers - PTR records
220 IN PTR services.clync.com.

; OpenShift Container Platform Cluster - PTR records
200 IN PTR bootstrap.okd4.clync.com.
201 IN PTR control-1.okd4.clync.com.
202 IN PTR control-2.okd4.clync.com.
203 IN PTR control-3.okd4.clync.com.
204 IN PTR compute-1.okd4.clync.com.
205 IN PTR compute-2.okd4.clync.com.
220 IN PTR api.okd4.clync.com.
220 IN PTR api-int.okd4.clync.com.
