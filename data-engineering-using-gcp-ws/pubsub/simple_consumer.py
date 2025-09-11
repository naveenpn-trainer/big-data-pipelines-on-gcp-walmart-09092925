from google.cloud.pubsub_v1 import SubscriberClient

def callback_fn(message):
    print(f"Message= {message.data.decode('utf-8')}")
    message.ack()

if __name__ == '__main__':
    subscriber = SubscriberClient()
    topic_name = "projects/upgradlabs-1746955327900/topics/my-demo-topic"
    subscription_id = "projects/upgradlabs-1746955327900/subscriptions/my-demo-topic-sub-0"

    future = subscriber.subscribe(subscription_id, callback=callback_fn)
    print(future.result())