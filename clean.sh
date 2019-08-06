gcloud pubsub subscriptions delete echo-read
gcloud pubsub topics delete echo

kubectl delete -f kubernetes-manifests/pubsub.yaml

gcloud iam service-accounts remove-iam-policy-binding \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:olivierba-sandbox.svc.id.goog[custom-metrics/custom-metrics-stackdriver-adapter]" \
  361681312054-compute@developer.gserviceaccount.com #gke-horizontal-pod-autoscaler@olivierba-sandbox.iam.gserviceaccount.com

#gcloud iam service-accounts delete gke-horizontal-pod-autoscaler@olivierba-sandbox.iam.gserviceaccount.com --quiet

kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-stackdriver/master/custom-metrics-stackdriver-adapter/deploy/production/adapter_new_resource_model.yaml