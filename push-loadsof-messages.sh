#!/bin/sh
for i in {1..999} 
do
    gcloud pubsub topics publish echo --message="Hello, world!"
done