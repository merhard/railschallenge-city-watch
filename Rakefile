require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc 'Runs rubocop static code analyzer'
task :rubocop do
  sh 'rubocop'
end

task(:default).clear
task default: [:test, :rubocop]
