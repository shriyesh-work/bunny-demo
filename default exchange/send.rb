require 'bunny'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue('hello')
message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')
channel.default_exchange.publish(message, routing_key: queue.name)
puts "Published to default_exchange"
connection.close