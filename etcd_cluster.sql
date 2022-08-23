
### etcd1 server

ETCD_NAME=etcd1
ETCD_DATA_DIR=/var/lib/etcd
ETCD_LISTEN_CLIENT_URLS=http://10.48.21.125:2379,http://127.0.0.1:2379
ETCD_LISTEN_PEER_URLS=http://10.48.21.125:2380
ETCD_ADVERTISE_CLIENT_URLS=http://10.48.21.125:2379
ETCD_INITIAL_ADVERTISE_PEER_URLS=http://10.48.21.125:2380
ETCD_INITIAL_CLUSTER=etcd1=http://10.48.21.125:2380,etcd2=http://10.48.41.57:2380
ETCD_INITIAL_CLUSTER_STATE=new
ETCD_INITIAL_CLUSTER_TOKEN=etcd-cluster



### etcd2 server

ETCD_NAME=etcd2
ETCD_DATA_DIR=/var/lib/etcd
ETCD_LISTEN_CLIENT_URLS=http://10.48.41.57:2379,http://127.0.0.1:2379
ETCD_LISTEN_PEER_URLS=http://10.48.41.57:2380
ETCD_ADVERTISE_CLIENT_URLS=http://10.48.41.57:2379
ETCD_INITIAL_ADVERTISE_PEER_URLS=http://10.48.41.57:2380
ETCD_INITIAL_CLUSTER=etcd1=http://10.48.21.125:2380,etcd2=http://10.48.41.57:2380
ETCD_INITIAL_CLUSTER_STATE=new
ETCD_INITIAL_CLUSTER_TOKEN=etcd-cluster


Copy this script to /etc/systemd/system/etcd.service file on all etcd notes:

[Unit]
Description=etcd

[Service]
Type=notify
EnvironmentFile=/etc/etcd
ExecStart=/usr/bin/etcd
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target



