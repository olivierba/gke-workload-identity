# -*- coding: utf-8 -*-
"""Pub/Sub pull example on Google Kubernetes Engine.

This program pulls messages from a Cloud Pub/Sub topic and
prints to standard output.
"""

import datetime
import time
import os

from google.cloud import pubsub

PUBSUB_TOPIC = 'echo'
PUBSUB_SUBSCRIPTION = 'echo-read'
PROJECT=os.getenv('GOOGLE_CLOUD_PROJECT')

def main():

    subscriber = pubsub.SubscriberClient()
    topic_name = 'projects/{project_id}/topics/{topic}'.format(
        project_id=os.getenv('GOOGLE_CLOUD_PROJECT'),
        topic=PUBSUB_TOPIC,  
    )

    subscription_name = 'projects/{project_id}/subscriptions/{sub}'.format(
        project_id=os.getenv('GOOGLE_CLOUD_PROJECT'),
        sub=PUBSUB_SUBSCRIPTION, 
    )

    #subscriber.create_subscription(name=subscription_name, topic=topic_name)

  


    """Continuously pull messages from subsciption"""
    #client = pubsub.Client()
    #subscription = client.topic(PUBSUB_TOPIC).subscription(PUBSUB_SUBSCRIPTION)

    print('Pulling messages from Pub/Sub subscription...')
    while True:
        try:
            print("Project:"+PROJECT)
            subscription_path = subscriber.subscription_path(PROJECT, PUBSUB_SUBSCRIPTION)
            response = subscriber.pull(subscription_path, max_messages=10)

            for msg in response.received_messages:
                print("[{0}] Received message: ID={1} Data={2}".format(
                    datetime.datetime.now(),
                    msg.message_id,
                    msg.data))
                process(msg)
        
            ack_ids = [msg.ack_id for msg in response.received_messages]
            subscriber.acknowledge(subscription_path, ack_ids)
        except Exception as err:
            print(err.message)


def process(message):
    """Process received message"""
    print("[{0}] Processing: {1}".format(datetime.datetime.now(),
                                         message.message_id))
    time.sleep(3)
    print("[{0}] Processed: {1}".format(datetime.datetime.now(),
                                        message.message_id))


if __name__ == '__main__':
    main()
