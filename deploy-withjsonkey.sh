# service account 
gcloud iam service-accounts create gke-pub-sub-identity --display-name "GKE demo pub-sub account"

gcloud projects add-iam-policy-binding olivierba-sandbox \
  --member serviceAccount:gke-pub-sub-identity@olivierba-sandbox.iam.gserviceaccount.com \
  --role roles/pubsub.subscriber

gcloud iam service-accounts keys create key.json \
  --iam-account gke-pub-sub-identity@olivierba-sandbox.iam.gserviceaccount.com

kubectl create secret generic pubsub-key --from-file=key.json

kubectl apply -f others-k8s-manifests/pubsub-with-secret.yaml