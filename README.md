# Sidekiq Demo

## A sample project to test the sidekiq worker of ruby.

### Steps to run the project:

1. Run a redis server<br />
redis-server

2. Execute the worker<br />
bundle exec sidekiq -r ./worker.rb

3. Run the worker in an irb console<br />
bundle exec irb -r ./worker.rb<br />
OurWorker.perform_async("easy")<br />
OurWorker.perform_async("hard")<br />
OurWorker.perform_in(5,"easy")

4. Monitor using rack<br />
rackup

5. Paas signals to sidekiq jobs<br />
ps ax | grep sidekiq<br />
kill -TTIN/USR1/TERM &lt;pid&gt;

6. Specify a pitfall location<br />
bundle exec irb -r ./worker.rb -P ~/tmp/sidekiq.pid<br />
cat ~/tmp/sidekiq.pid

7. Stop job<br />
sidekiqctl stop &lt;pid or pitfall file location&gt;
