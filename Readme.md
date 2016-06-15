## Sinatra-stream Example

Sinatra example using EventSource (Server Sent Events)

Original code from: <https://gist.github.com/maccman/2992949>

Server Sent Events are an awesome api that lets you push data asynchronously directly to your clients.

<https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events>
<https://developer.mozilla.org/en-US/docs/Web/API/EventSource>


A polyfill for EventSource is available (thanks IE), please check:

<https://github.com/Yaffle/EventSource>

### Setup:

    gem i bundler

    bundle

(you need to have Redis installed)

On ubuntu you can install redis by:

    apt-get install redis-server

# Run:

    bundle exec rackup

# Usage:

    Open <http://localhost:4567>

Then from your console:


    redis-cli publish message hello

Voila', you shoul see your message in every browser window you have open.
