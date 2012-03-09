namespace :follow_up do
  desc "Processing of today's follow-ups"
  task :process => :environment do
    ::FollowUp.process
  end
end
