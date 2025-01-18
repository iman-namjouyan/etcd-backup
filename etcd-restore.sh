#!/bin/bash
#===========================[Define Variables]
export ETCD_ENDPOINTS=https://192.168.1.100:2379
export ETCD_CACERT=/etc/ssl/etcd/ssl/ca.pem
export ETCD_CERT=/etc/ssl/etcd/ssl/member-k8s-master01.pem
export ETCD_KEY=/etc/ssl/etcd/ssl/member-k8s-master01-key.pem
export ETCD_BACKUPDB=/root
#===========================[Body]
etcdctl snapshot restore $ETCD_BACKUPDB/etcd-backup-$(date +'%Y%m%d').db \
  --data-dir=/app/etcd \
  --name etcd1 \
  --initial-cluster etcd1=https://192.168.1.100:2380,etcd2=https://192.168.1.101:2380,etcd3=https://192.168.1.102:2380 \
  --initial-cluster-token k8s_etcd \
  --initial-cluster-state new \
  --cacert=$ETCD_CACERT \
  --cert=$ETCD_CERT \
  --key=$ETCD_KEY
