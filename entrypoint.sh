#!/bin/sh

reconnect_dashboard() {
    echo 
    echo "-----------------|CONNECTING TO PROMETHEUS|-----------------"
    cp /config/${CLUSTER_NAME}.cnf $HOME/.kube/config
    export POD_NAME=$(kubectl get pods --namespace kube-system -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")
    kubectl --namespace kube-system port-forward --address 0.0.0.0 $POD_NAME 9090:9090
}

"$@"
