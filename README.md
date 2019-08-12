# Pub/Sub on Kubernetes Engine

This repository contains source code, Docker image build file and Kubernetes
manifests for Pub/Sub on Kubernetes Engine tutorial. Please follow the tutorial
at https://cloud.google.com/kubernetes-engine/docs/tutorials/authenticating-to-cloud-pubsub.

The client in this demo has be updated to match the correct implementation of v0.45 of python client librarie for pub sub.

2 deployement scenarios are possible:
- using workload identity to authenticate against pub/sub with a proper IaM account 
- authenticating using a JSON key (you need to supply yours) mounted in th container with a secret, less secured preferably avoided.

This illustrate the advantages of using WI vs using user supply key. 
- No need to manage key
- Less risks of key leaking out and being compromised.

This program reads messaged published on a particular topic and prints them on
standard output.

Note 08/12/2019
- If you use PodSecurity Policies (PSP) you need to modify the stackdriver adapter deployment to grand permission to a less restrictive PSP to the stackdriver kubernetes service account that why we're not direclty refering the reference yaml file.
- There seems to be a issue with stackriver adapter when used on a WI enabled cluster. until this is fixed the demo will only work in WI mode without the autscaler.
