class TestingJob
  include Sidekiq::Worker

  def perform(start_date, end_date)
    puts "SIDEKIQ WORKER GENERATING REPORT FROM #{start_date} TO #{end_date}"
  end

end