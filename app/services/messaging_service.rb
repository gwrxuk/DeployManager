class MessagingService
  def initialize
    @connection = Bunny.new
    @connection.start
    @channel = @connection.create_channel
  end

  def publish(queue, message)
    queue = @channel.queue(queue)
    queue.publish(message)
  end

  def close
    @connection.close
  end
end
