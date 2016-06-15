require_relative './config/env'

class SinatraSSE < Sinatra::Base

  get '/' do
    haml :index
  end

  get '/subscribe' do
    content_type 'text/event-stream'
    stream(:keep_open) do |out|
      CONNS << out
      out.callback { CONNS.delete out }
    end
  end

  Thread.new do
    redis = Redis.connect
    redis.psubscribe('message', 'message.*') do |on|
      on.pmessage do |match, channel, message|
        channel = channel.sub 'message.', ''

        CONNS.each do |out|
          out << "event: #{channel}\n\n"
          out << "data: #{message}\n\n"
        end
      end
    end
  end

end
