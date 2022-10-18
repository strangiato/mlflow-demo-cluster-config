#!/bin/bash
set -e

ARGO_NS="openshift-gitops"

echo "Validating cluster login"
oc whoami

echo ""
echo "Installing tenant components."

oc apply -k bootstrap/overlays/default

echo ""
echo "View the status of the sync in the OpenShift GitOps Instance:"

route=$(oc get route openshift-gitops-server -o=jsonpath='{.spec.host}' -n ${ARGO_NS})

echo "https://${route}"
