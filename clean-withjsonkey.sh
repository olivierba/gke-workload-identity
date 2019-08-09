gcloud pubsub subscriptions delete echo-read
gcloud pubsub topics delete echo

kubectl delete -f kubernetes-manifests/pubsub.yaml


kubectl delete -f adapter_new_resource_model.yaml


# service account 

gcloud projects remove-iam-policy-binding olivierba-sandbox \
  --member serviceAccount:gke-pub-sub-identity@olivierba-sandbox.iam.gserviceaccount.com \
  --role roles/pubsub.subscriber

gcloud iam service-accounts delete gke-pub-sub-identity --display-name "GKE demo pub-sub account"

kubectl delete secret pubsub-key

kubectl delete -f others-k8s-manifests/pubsub-with-secret.yaml


