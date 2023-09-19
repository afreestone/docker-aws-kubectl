#!/bin/sh

aws eks update-kubeconfig --region "$AWS_REGION" --name "$EKS_CLUSTER_NAME"
kubectl -n="$EKS_NAMESPACE" set image deployment "$EKS_APP_NAME" "$EKS_IMAGE_NAME=$EKS_IMAGE_LABEL"