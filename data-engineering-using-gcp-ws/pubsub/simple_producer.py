from google.cloud.pubsub_v1 import PublisherClient
if __name__ == '__main__':
  publisher = PublisherClient()
  topic_name = "projects/upgradlabs-1746955327900/topics/my-demo-topic"
  data = '{"name":"Naveen Pnn"}'
  message = bytes(data,'utf-8')
  future = publisher.publish(topic_name,message)
  print(future.result())

