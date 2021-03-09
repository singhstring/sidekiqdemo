require "sidekiq"

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class OurWorker
  include Sidekiq::Worker
  sidekiq_options retry: 0

  def perform(complexity)
    case complexity
    when "hard"
      puts "Charging a credit card"
      raise "Woops stuff got bad"
      sleep 20
      puts "Lot of effort"
    else
      sleep 1
      puts "Wasn't that hard"
    end
  end
end


=begin
Execution
1. Run a redis server
redis-server

2. Execute the worker
bundle exec sidekiq -r ./worker.rb

3. Run the worker in an irb console
bundle exec irb -r ./worker.rb
OurWorker.perform_async("easy")
OurWorker.perform_async("hard")
OurWorker.perform_in(5,"easy")

4. Monitor using rack
rackup

5. Paas signals to sidekiq jobs
ps ax | grep sidekiq
kill -TTIN/USR1/TERM <pid>

6. Specify a pitfall location
bundle exec irb -r ./worker.rb -P ~/tmp/sidekiq.pid
cat ~/tmp/sidekiq.pid

7. Stop job
sidekiqctl stop <pid or pitfall file location>

=end