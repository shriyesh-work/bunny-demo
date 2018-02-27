require 'bunny'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue('hello')
begin
  queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts "message: #{body}"
  end
rescue Interrupt => _
  connection.close
  exit(0)
end