kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-stackdriver/master/custom-metrics-stackdriver-adapter/deploy/production/adapter_new_resource_model.yaml

gcloud iam service-accounts create gke-horizontal-pod-autoscaler --display-name "GKE Pod Horizontal autoscaler"

gcloud iam service-accounts add-iam-policy-binding \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:olivierba-sandbox.svc.id.goog[custom-metrics/custom-metrics-stackdriver-adapter]" \
  gke-horizontal-pod-autoscaler@olivierba-sandbox.iam.gserviceaccount.com

kubectl annotate serviceaccount --namespace custom-metrics custom-metrics-stackdriver-adapter iam.gke.io/gcp-service-account=gke-horizontal-pod-autoscaler@olivierba-sandbox.iam.gserviceaccount.com --overwrite=true

