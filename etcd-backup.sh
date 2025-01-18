#!/bin/bash
#===========================[Define Variables]
export ETCD_ENDPOINTS=https://10.0.82.100:2379
export ETCD_CACERT=/etc/ssl/etcd/ssl/ca.pem
export ETCD_CERT=/etc/ssl/etcd/ssl/member-k8s-master01.pem
export ETCD_KEY=/etc/ssl/etcd/ssl/member-k8s-master01-key.pem
export ETCD_BACKUPDB=/root
#===========================[Body]
etcdctl snapshot save $ETCD_BACKUPDB/etcd-backup-$(date +'%Y%m%d').db \
  --endpoints=$ETCD_ENDPOINTS \
  --cacert=$ETCD_CACERT \
  --cert=$ETCD_CERT \
  --key=$ETCD_KEY
#===========================[Checking Backup File]
echo -e "\n\n"
echo -e "\e[0;32m======================[Checking Backup File]======================\e[m"
sleep 3
etcdctl snapshot status $ETCD_BACKUPDB/etcd-backup-$(date +'%Y%m%d').db
