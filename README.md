# Aidekiq Demo

## A sample project to test the sidekiq worker of ruby.

### Steps to run the project:

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
