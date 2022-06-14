#!/bin/bash
set -e

echo "Validating cluster login"
oc whoami

echo ""
echo "Installing tenant components."

kustomize build bootstrap/overlays/default | oc apply -f -

echo ""
echo "View the status of the sync in the OpenShift GitOps Instance:"

route=$(oc get route openshift-gitops-server -o=jsonpath='{.spec.host}' -n ${ARGO_NS})

echo "https://${route}"
